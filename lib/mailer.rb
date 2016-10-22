require 'sendgrid-ruby'
include SendGrid
require 'json'
class Mailer

  FROM_EMAIL = "grassyhill_inquiry@bluebird.club"

  def self.send_email(from_email, to_email, subject, content)
  email = SendGrid::Mail.new
  email.from = SendGrid::Email.new(email: from_email)
  email.subject = subject
  per = SendGrid::Personalization.new
  per.to = SendGrid::Email.new(email: to_email)

  email.personalizations = per

  email.contents = SendGrid::Content.new(type: 'text/plain', value: content)
  email.contents = Content.new(type: 'text/html', value: content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

  response = sg.client.mail._('send').post(request_body: email.to_json)
end

def self.web_inquiry(message, name, email)
  controller = ActionController::Base.new()
  content = controller.render_to_string(:layout => 'mailer', :template => '/mailer/web_inquiry.html.erb',
    :locals => {
      :@message => message,
      :@name => name,
      :@email => email
  })
  self.send_email(FROM_EMAIL, 'grassyhillproductions4@gmail.com', "Website Inquiry", content)
end

end
