class DeliveryMailer < ActionMailer::Base
  default :from => "dibbist@dibbist.com"

  def dynamic_email(body, subject, email)
    @body = body
    mail to: email, subject: subject 
  end
end
