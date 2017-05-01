class GreetingCardsController < ApplicationController

  def create
    return false if current_user.nil?
    GreetingCard.create(greeting_card_params)
    redirect_to request.referrer
  end

  def destroy
    return false if current_user.nil?
    greeting_card = GreetingCard.find(params[:id])
    greeting_card.destroy
    redirect_to request.referrer
  end

  def index
    @birthday_picture = GreetingCard.where('category = ?', 'Birthday').first if GreetingCard.all.length > 0
    @anniversary_picture = GreetingCard.where('category = ?', 'Anniversary').first if GreetingCard.all.length > 0
    @sympathy_picture = GreetingCard.where('category = ?', 'Sympathy').first if GreetingCard.all.length > 0
    @thank_you_picture = GreetingCard.where('category = ?', 'Thank You').first if GreetingCard.all.length > 0
    @love_picture = GreetingCard.where('category = ?', 'Love').first if GreetingCard.all.length > 0
    @congratulations_picture = GreetingCard.where('category = ?', 'Congratulations').first if GreetingCard.all.length > 0
  end

  def birthday
    @cards = GreetingCard.where('category = ?', 'Birthday').live
  end

  def sympathy
    @cards = GreetingCard.where('category = ?', 'Sympathy').live
  end

  def thank_you
    @cards = GreetingCard.where('category = ?', 'Thank You').live
  end

  def love
    @cards = GreetingCard.where('category = ?', 'Love').live
  end

  def congratulations
    @cards = GreetingCard.where('category = ?', 'Congratulations').live
  end

  def anniversary
    @cards = GreetingCard.where('category = ?', 'Anniversary').live
  end

  private
  def greeting_card_params
    params.require(:greeting_card).permit(:front_image, :inside_image, :code, :category)
  end

end
