require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "time formatting" do
    assert_equal time_format(1),      "1:00"
    assert_equal time_format(24),     "24:00"
    assert_equal time_format(29.5),   "29:30"
    assert_equal time_format(127.34), "127:20"
    assert_equal time_format(0),      "0:00"
  end
end
