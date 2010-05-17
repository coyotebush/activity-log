# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def time_format(hours)
    minutes = "%02d" % ((hours - hours.truncate) * 60).to_i
    "#{hours.to_i}:#{minutes}"
  end

  def decimal_format(x)
    "%.2f" % x if x.is_a? Numeric
  end
end
