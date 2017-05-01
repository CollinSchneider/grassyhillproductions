class AdminController < ApplicationController
	before_filter :verify_admin, except: [:index]

	def index
		redirect_to '/admin/logged_in' if current_user
	end

	def logged_in
		verify_admin
	end

	def greeting_cards
		@cards = GreetingCard.live
	end

	def led_pictures
		@led_picture = LedPicture.new
		@live_leds = LedPicture.live
		@discontinued_leds = LedPicture.discontinued
	end

	private
	def verify_admin
		redirect_to '/' if current_user.nil?
	end

end