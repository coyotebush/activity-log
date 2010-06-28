class UsersController < ApplicationController
  before_filter 'require_no_user', :only => [:new, :create, :confirm]

  def new
    @user = User.new
    render :layout => 'unauthenticated'
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated account."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def create
    @user = User.new(params[:user])

    # Must be activated before login
    if verify_recaptcha(:model => @user, :timeout => 3) &&
       @user.save_without_session_maintenance
      @user.deliver_confirmation_instructions!
      flash[:notice] = "Your account has been created! Please check your email for activation instructions."
      redirect_to register_url
    else
      render :action => 'new', :layout => 'unauthenticated'
    end
  end

  def confirm
    @user = User.find_using_perishable_token(params[:code], 1.week)

    if @user.nil? or @user.confirmed?
      flash[:notice] = "This confirmation code is not valid."
      redirect_to login_url
    elsif @user.confirm!
      flash[:notice] = "Your email address has been confirmed!"
      UserSession.create(@user, false)
      redirect_to root_url
    else
      flash[:notice] = "Activation failed."
      redirect_to register_url
    end
  end
end
