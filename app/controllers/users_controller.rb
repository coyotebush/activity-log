class UsersController < ApplicationController
  def new
    @user = User.new
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
    if verify_recaptcha(:model => @user, :timeout => 3) && @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
