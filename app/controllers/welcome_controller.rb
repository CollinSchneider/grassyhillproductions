class WelcomeController < ApplicationController

  def index
    @greeting_card_picture = GreetingCard.all.first
    @led_picture = LedPicture.all.first
    @guitar_string_bracelet_picture = GuitarStringBracelet.all.first
  end

  def about
  end

  def contact
    if request.post?
      message = params[:message]
      subject = params[:subject]
      from_email = params[:email]
      from_name = params[:name]
      Mailer.contact_email(message, from_name, from_email, subject).deliver!
    end
  end

end
