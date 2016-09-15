class ShippingAddressesController < ApplicationController

  def create
    sa = ShippingAddress.create(shipping_address_params)
    if sa.save
      flash[:success] = "Address added successfully"
      return redirect_to request.referrer
    else
      flash[:error] = sa.errors.full_messages
      return redirect_to request.referrer
    end
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:retailer_id, :name, :street_one, :street_two, :city, :zip, :state)
  end

end
