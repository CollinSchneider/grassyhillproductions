class WelcomeController < ApplicationController

  def index
    @greeting_card_picture = GreetingCard.all.first
    @led_picture = LedPicture.all.first
    @guitar_string_bracelet_picture = GuitarStringBracelet.all.first
  end

  def about
  end

  def contact
  end

end
