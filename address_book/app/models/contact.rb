class Contact < ActiveRecord::Base

	def self.all_in_alphabetical_order
		Contact.all.order("name ASC")
	end
end
