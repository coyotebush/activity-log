require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "should not be valid" do
    @activity = Activity.new
    assert !@activity.valid?

    @activity = Activity.new :start_time => "2010-05-16 10:08:46"
    assert !@activity.valid?

    @activity = Activity.new :end_time => "2010-05-16 10:08:46"
    assert !@activity.valid?

    @activity = Activity.new :start_time => "2010-05-16 10:08:46",
                             :end_time => "2010-05-16 10:54:13",
                             :distance => "-1.2"
    assert !@activity.valid?

    # Must start before it ends
    @activity = Activity.new :start_time => "2010-05-16 10:08:46",
                             :end_time => "2010-05-16 8:08:23"
    assert !@activity.valid?

    @activity = Activity.new :start_time => "2010-05-16 10:08:46",
                             :end_time => "2010-05-16 10:08:46"
    assert !@activity.valid?
  end

  test "should be valid" do
    @activity = Activity.new :start_time => "2010-05-16 10:08:46",
                             :end_time => "2010-05-16 10:54:13"
    assert @activity.valid?

    @activity = Activity.new :start_time => "2010-05-16 10:08:46",
                             :end_time => "2010-05-16 10:54:13",
                             :distance => 3.4
    assert @activity.valid?
  end

  test "should calculate elapsed time" do
    assert_in_delta 3.23333, activities(:two).elapsed, 0.00001
    assert_equal activities(:three).elapsed, 3.0
  end

  test "should calculate average speed" do
    assert_equal activities(:three).average_speed, 0.5
    assert_equal activities(:piano).average_speed, 8.5
  end
end
