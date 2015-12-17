class LinksController < ApplicationController

	def home
		render 'home'
	end

	def reroute
		longlink=Link.find_route(params[:shortlink])
		if longlink.present?
			redirect_to longlink 
		else
			redirect_to "#{new_link_path}"
		end
	end

	def new
		@link = Link.new
		@sitename = "Shorten your URL"
	end

	def create
		original_url = params[:link][:original_url]
		short_url = Link.create_short_url(3)
		link = Link.new(original_url: original_url , short_url: short_url)
		if link.save
			redirect_to "/links/#{link.id}"	
		else
			flash[:alert] = "Something went wrong :( Please try again."
			render 'new'
		end		
	end

	def show
		@link=Link.find(params[:id])
	end
end
