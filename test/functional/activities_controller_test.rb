require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, :activity => { :start_time => "2010-05-16 10:08:46", :end_time => "2010-05-16 10:08:46"  }
    end

    assert_redirected_to activities_path
  end

  test "should update activity" do
    put :update, :id => activities(:one).to_param, :activity => { }
    assert_redirected_to activities_path
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, :id => activities(:one).to_param
    end

    assert_redirected_to activities_path
  end
end
