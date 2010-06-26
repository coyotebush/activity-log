class ActivitiesController < InheritedResources::Base
  before_filter 'require_user'
  actions :all, :except => :show
  respond_to :html, :xml
  def create
    create! { activities_url }
  end
  def update
    update! { activities_url }
  end
  protected
    def collection
      @activities ||= end_of_association_chain.find(:all, :order => 'start_time DESC')
    end
end
