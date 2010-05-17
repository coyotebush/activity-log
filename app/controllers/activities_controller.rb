class ActivitiesController < InheritedResources::Base
  actions :all, :except => :show
  def create
    create! { activities_url }
  end
  def update
    update! { activities_url }
  end
end
