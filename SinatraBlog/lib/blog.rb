class Blog
	def initialize
		@posts=[]
	end
	
	def add_post(post)
		@posts << post
	end

	def posts
		@posts
	end

	def latest_posts
		@posts.sort {|x,y| y.show_date <=> x.show_date}
	end
	
end