class LinksController < ApplicationController

	def home
		render 'home'
	end

	def reroute
		longlink=Link.find_route(params[:shortlink])
		redirect_to "http://"+longlink
	end
end
