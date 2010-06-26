require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  def setup
    activate_authlogic
    UserSession.create(users(:ben))
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get report" do
    get :report
    assert_response :success

    get :report, :start_date => { :year => "2010", :month => "2", :day => "2" },
                 :end_date => { :year => "2010", :month => "10", :day => "9" }
    assert_response :success
  end
end
