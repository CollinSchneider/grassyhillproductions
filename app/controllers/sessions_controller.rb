class SessionsController < ApplicationController

	def create
		user = User.find_by(:username => params[:username].downcase)
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/admin/logged_in'
		else
			flash[:error] = 'Incorrect username or password.'
			redirect_to request.referrer
		end
	end

end