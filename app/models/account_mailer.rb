class AccountMailer < ActionMailer::Base
  def confirmation_instructions(user)
    subject     "Account Confirmation Instructions"
    from        "noreply@activity-log.heroku.com"
    recipients  user.email
    body        :confirmation_url => confirm_url(user.perishable_token)
  end
end
