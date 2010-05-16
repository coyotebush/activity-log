class Activity < ActiveRecord::Base
  validates_presence_of :start_time, :end_time
  validate :must_start_before_ending
  
  def must_start_before_ending
    if !end_time.nil? and !start_time.nil? and end_time < start_time
      errors.add_to_base("End time cannot be before start time")
	end
  end
end
