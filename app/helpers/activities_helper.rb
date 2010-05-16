module ActivitiesHelper
  def recent_datetime_select (f, field, options = {})
    f.datetime_select field, {:start_year => Time.now.year - 1, :end_year => Time.now.year}.merge(options)
  end
end
