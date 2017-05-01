class UsersController < ApplicationController

	def create
		user = User.create(user_params)
		if user.save
			redirect_to request.referrer
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :password)
	end

end