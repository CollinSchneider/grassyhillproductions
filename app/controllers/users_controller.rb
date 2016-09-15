class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      retailer = Retailer.new
      retailer.user_id = user.id
      retailer.save!
      session[:user_id] = user.id
      if params[:redirect_url].nil?
        redirect_to root_path
      else
        redirect_to params[:redirect_url]
      end
    else
      flash[:error] = user.errors.full_messages
      return redirect_to request.referrer
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/login'
  end

  def thank_you
    @order = Order.find(params[:id])
    return redirect_to root_path if @order.retailer_id != current_user.retailer.id
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
