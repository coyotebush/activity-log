require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "decimal formatting" do
    assert_nil   decimal_format(nil)
    assert_equal decimal_format(1),      "1.00"
    assert_equal decimal_format(1.0),    "1.00"
    assert_equal decimal_format(1.00),   "1.00"
    assert_equal decimal_format(1.2),    "1.20"
    assert_equal decimal_format(1.23),   "1.23"
    assert_equal decimal_format(1.234),  "1.23"
    assert_equal decimal_format(1.2345), "1.23"
    assert_equal decimal_format(1.235),  "1.24"
    assert_equal decimal_format(1.2362), "1.24"
  end

  test "time formatting" do
    assert_equal time_format(1),      "1:00"
    assert_equal time_format(24),     "24:00"
    assert_equal time_format(29.5),   "29:30"
    assert_equal time_format(127.34), "127:20"
    assert_equal time_format(0),      "0:00"
  end
end
