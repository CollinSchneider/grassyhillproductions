class Mailer < ApplicationMailer

  def contact_email(message, from_name, from_email, subject)
    @message = message
    @from_email = from_email
    @from_name = from_name
    @subject = subject
    mail(to: "grassyhillproductions4@gmail.com", subject: "#{@subject}")
  end

end
