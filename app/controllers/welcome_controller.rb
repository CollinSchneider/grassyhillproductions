class WelcomeController < ApplicationController

  def index
    @greeting_card_picture = GreetingCard.all.first
    @led_picture = LedPicture.all.first
    @guitar_string_bracelet_picture = GuitarStringBracelet.all.first
  end

  def contact
    if request.post?
      message = params[:message]
      from_email = params[:email]
      from_name = params[:name]
      Mailer.web_inquiry(message, from_name, from_email)
    end
  end

end
