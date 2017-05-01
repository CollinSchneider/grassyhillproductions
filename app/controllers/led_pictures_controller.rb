class LedPicturesController < ApplicationController

  def create
    return false if current_user.nil?
    params[:led_picture][:discontinued] = true
    # params[:led_picture][:type] = params[:horizontal] == 'true' ? 'Horizontal' : 'Vertical'
    binding.pry
    led = LedPicture.create(led_picture_params)
    if led.save
      flash[:success] = "#{led.code} is now live."
    else
      flash[:error] = led.errors.join('\n').html_safe
    end
    redirect_to request.referrer
  end

  def destroy
    return false if current_user.nil?
    led = LedPicture.find(params[:id])
    led.destroy
    flash[:success] = "#{led.code} deleted."
    redirect_to request.referrer
  end

  def discontinue
    return false if current_user.nil?
    led = LedPicture.find(params[:id])
    led.update_column(:discontinued, true)
    flash[:success] = "#{led.code} is now discontinued."
    redirect_to request.referrer
  end

  def recontinue
    return false if current_user.nil?
    led = LedPicture.find(params[:id])
    led.update_column(:discontinued, false)
    flash[:success] = "#{led.code} is now live."
    redirect_to request.referrer
  end

  def update
    led_picture = LedPicture.find(params[:id])
    led_picture.update(led_picture_params)
    redirect_to request.referrer
  end

  def index
    @led_pictures = LedPicture.all.order(code: :asc).live
  end

  private
  def led_picture_params
    params.require(:led_picture).permit(:code, :title, :type, :image, :gif, :discontinued)
  end

end
