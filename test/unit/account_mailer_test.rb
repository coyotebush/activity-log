require 'test_helper'

class AccountMailerTest < ActionMailer::TestCase
  def setup
    ActionMailer::Base.default_url_options = { :host => 'localhost' }
  end

  test "confirmation email" do
    user = users(:bob)
    
    email = user.deliver_confirmation_instructions!
    assert !ActionMailer::Base.deliveries.empty?
    
    assert_equal [user.email], email.to
    assert_match /localhost\/confirm\/#{user.perishable_token}/, email.body
  end
end
