class GuitarStringBraceletsController < ApplicationController

  def create
    GuitarStringBracelet.create(guitar_string_bracelet_params)
    redirect_to request.referrer
  end

  def destroy
    guitar_string_bracelet = GuitarStringBracelet.find(params[:id])
    guitar_string_bracelet.destroy
    redirect_to request.referrer
  end

  def index
  end

  private
  def guitar_string_bracelet_params
    params.require(:guitar_string_bracelet).permit(:code, :description, :image)
  end

end
