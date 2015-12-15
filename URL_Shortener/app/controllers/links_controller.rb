class LinksController < ApplicationController

	def home
		render 'home'
	end

	def reroute
		longlink=Link.find_route(params[:shortlink])
		redirect_to "http://"+longlink
	end

	def new
		@link = Link.new
		@sitename = "Shorten your URL"
	end

	def create
		short_url = Link.create_short_url(3)
		original_url = params[:original_url]
		@link = Link.new(original_url: original_url , short_url: short_url)
		@link.save
		render "show"
	end

	def show
	end
end
