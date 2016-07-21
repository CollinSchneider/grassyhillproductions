class LedPicturesController < ApplicationController

  def create
    LedPicture.create(led_picture_params)
    redirect_to request.referrer
  end

  def destroy
    led_picture = LedPicture.find(params[:id])
    led_picture.destroy
    redirect_to request.referrer
  end

  def index
    @led_pictures = LedPicture.all
  end

  private
  def led_picture_params
    params.require(:led_picture).permit(:image, :gif, :code)
  end

end
