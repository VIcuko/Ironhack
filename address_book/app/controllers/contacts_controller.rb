class ContactsController < ApplicationController

	def index
		@contact=Contact.all
	end

	def new

	end

	def create
		render(:text => "This route is contacts#create.")
	end

end
