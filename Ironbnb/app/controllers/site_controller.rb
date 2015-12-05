class SiteController < ApplicationController
	def home
		@site_name="Home"
	end

	def become_host
		@site_name="Become Host"
	end

	def help
		@site_name="Help"
	end

	def sign_up
		@site_name="Sign Up"
	end

	def log_in
		@site_name="Log In"
	end
end