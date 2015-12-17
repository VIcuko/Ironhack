class Link < ActiveRecord::Base
	validates :original_url, :short_url, presence: true, uniqueness: {case_sensitive: false}
	validates :original_url, format: {with: /^http[s]?:\/\//}

	def self.find_route(shortlink)
		longlink = where("short_url=?",shortlink).first
		rescue ActiveRecord::RecordNotFound
			longlink = nil
			binding.pry
		longlink.original_url
	end

	def self.create_short_url(n)
		url=Array.new(n,"")
		url=new_short_url(url)
	end

	private

	def self.new_short_url(url)
		url = generate_random_url(url)
		while Link.where("short_url=?", url).present? do
			url = generate_random_url(url)
		end
		return url
	end

	def self.generate_random_url(url)
		url.map! do |value|
			random_value
		end
		url.join("")
	end

	def self.random_value
		possible_values=[rand(0..9).to_s,rand(97..122).chr,rand(65..90).chr]
		possible_values[rand(0..2)]
	end
end
