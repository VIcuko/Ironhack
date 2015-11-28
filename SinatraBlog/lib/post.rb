class Post
	attr_reader :title, :date, :text
	def initialize(title, date, text)
		@title=title
		@date=Date.parse(date)
		@text=text
	end
	
	def show_title
		@title
	end

	def update_title(title)
		@title=title
	end

	def show_date
		date="#{@date.day}-#{@date.month}-#{@date.year}"
	end

	def update_date(date)
		@date=Date.parse(date)
	end

	def show_text
		@text
	end

	def update_text
		@text=text
	end

end