class Activity < ActiveRecord::Base
  validates_presence_of :start_time, :end_time
  validates_numericality_of :distance, :allow_nil => true,
                            :greater_than_or_equal_to => 0
  validate :must_start_before_ending

  def elapsed
    (end_time - start_time) / 3600
  end

  def average_speed
    distance / elapsed unless distance.nil?
  end

  def weeks_from some_date
    ((self.start_time - some_date) / 604800).floor
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
