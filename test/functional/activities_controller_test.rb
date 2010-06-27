require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  def setup
    activate_authlogic
    UserSession.create(users(:ben))
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, :activity => { :start_time => "2010-05-16 10:08", :end_time => "2010-05-16 10:11"  }
    end

    assert_redirected_to activities_path
  end

  test "should update activity" do
    put :update, :id => activities(:two).to_param, :activity => { }
    assert_redirected_to activities_path
  end

  test "should not update activity" do
    assert_raise ActiveRecord::RecordNotFound do
      put :update, :id => activities(:fun).to_param, :activity => { }
    end
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, :id => activities(:two).to_param
    end

    assert_redirected_to activities_path
  end

  test "should not destroy activity" do
    assert_difference('Activity.count', 0) do
      assert_raise ActiveRecord::RecordNotFound do
        delete :destroy, :id => activities(:fun).to_param
      end
    end
  end
end
