class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.find_by_email(params[:email].downcase)
    if !user
      flash[:error] = "No users found with this email"
      return redirect_to request.referrer
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:redirect_url].nil?
        return redirect_to root_path
      else
        return redirect_to params[:redirect_url]
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to request.referrer
  end

end
