class ActivitiesController < ApplicationController
  before_filter 'require_user'
  before_filter 'find_activity', :only => [:edit, :update, :destroy]

  def index
    @activities = current_user.activities.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  def new
    @activity = current_user.activities.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  def edit
  end

  def create
    @activity = current_user.activities.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to(activities_url, :notice => 'Activity was successfully created.') }
        format.xml  { render :xml => @activity, :status => :created }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to(activities_url, :notice => 'Activity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(activities_url) }
      format.xml  { head :ok }
    end
  end

  private
    def find_activity
      @activity = current_user.activities.find(params[:id])
    end
end
