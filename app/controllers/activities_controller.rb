class ActivitiesController < InheritedResources::Base
  actions :all, :except => :show
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
