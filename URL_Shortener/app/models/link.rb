class Link < ActiveRecord::Base
	def self.find_route(shortlink)
		longlink = where("short_url=?",shortlink).first
		longlink = longlink.original_url
	end	
end
