class SessionsController < ApplicationController

	def create
		user = User.find_by(:username => params[:username].downcase)
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/admin/logged_in'
		end
	end

end