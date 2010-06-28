require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test "should be valid" do
    activate_authlogic
    session = UserSession.create(users(:fred))
    assert session.valid?
  end

  test "must be confirmed" do
    activate_authlogic
    session = UserSession.create(users(:bob))
    assert !session.valid?
  end
end
