class User < ActiveRecord::Base
  acts_as_authentic
  has_many :activities

  def confirm!
    self.confirmed = true
    save
  end

  def deliver_confirmation_instructions!
    reset_perishable_token!
    AccountMailer.deliver_confirmation_instructions(self)
  end
end
