class ContactsController < ApplicationController

	def index
		@contact=Contact.all_in_alphabetical_order
	end

	def new

	end

	def create
		contact = Contact.new(
			:name => params[:contact][:name],
			:address => params[:contact][:address],
			:phone => params[:contact][:phone],
			:email => params[:contact][:email],
			:favorite => params[:contact][:favorite]
			)
		name_informed=contact.name.present?
		address_informed=contact.address.present?
		
		contact.save if (name_informed && address_informed)
		redirect_to("/contacts")
	end

	def show
		@contact= Contact.find(params[:id])
	end

	def favorite
		@contact= Contact.all.where("favorite=?", true)
	end

	def edit
		@contact= Contact.find(params[:id])
	end
end
