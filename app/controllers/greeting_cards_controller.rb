class GreetingCardsController < ApplicationController

  def create
    GreetingCard.create(greeting_card_params)
    redirect_to request.referrer
  end

  def destroy
    greeting_card = GreetingCard.find(params[:id])
    greeting_card.destroy
    redirect_to request.referrer
  end

  def index
    @birthday_picture = GreetingCard.where('category = ?', 'Birthday').first if GreetingCard.all.length > 0
    @anniversary_picture = GreetingCard.where('category = ?', 'Anniversary').first if GreetingCard.all.length > 0
  end

  def birthday
    @cards = GreetingCard.where('category = ?', 'Birthday')
  end

  def sympathy
    @cards = GreetingCard.where('category = ?', 'Sympathy')
  end

  def thank_you
    @cards = GreetingCard.where('category = ?', 'Thank You')
  end

  def love
    @cards = GreetingCard.where('category = ?', 'Love')
  end

  def congratulations
    @cards = GreetingCard.where('category = ?', 'Congratulations')
  end

  def anniversary
    @cards = GreetingCard.where('category = ?', 'Anniversary')
  end

  private
  def greeting_card_params
    params.require(:greeting_card).permit(:front_image, :inside_image, :code, :category)
  end

end
