require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "should not be valid" do
    @activity = Activity.new
    assert !@activity.valid?

    @activity = Activity.new :start_time => "2010-05-16 10:08:46"
    assert !@activity.valid?

    @activity = Activity.new :end_time => "2010-05-16 10:08:46"
    assert !@activity.valid?

	# Must start before it ends
	@activity = Activity.new :start_time => "2010-05-16 10:08:46", :end_time => "2010-05-16 8:08:23"
    assert !@activity.valid?
  end

  test "should be valid" do
    @activity = Activity.new :start_time => "2010-05-16 10:08:46", :end_time => "2010-05-16 10:54:13"
    assert @activity.valid?
  end
end
