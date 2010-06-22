class Activity < ActiveRecord::Base
  validates_presence_of :start_time, :end_time
  validate :must_start_before_ending

  def elapsed
    (end_time - start_time) / 3600
  end

  def Activity.sum_elapsed
    sum = 0
    Activity.find(:all).each {|a| sum += a.elapsed}
    sum
  end

  def average_speed
    distance / elapsed unless distance.nil?
  end

  def must_start_before_ending
    if !end_time.nil? and !start_time.nil? and end_time <= start_time
      errors.add_to_base("End time cannot be before start time")
    end
  end

  define_easy_dates do
    format_for :start_time, :format => "%Y-%m-%d %I:%M %p"
    format_for :end_time, :format => "%Y-%m-%d %I:%M %p"
  end
end
