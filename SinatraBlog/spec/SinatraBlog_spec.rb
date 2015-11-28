#SinatraBlog_spec.rb
require 'pry'
require_relative "../lib/SinatraBlog.rb"
require 'spec_helper'

describe "Posts included in blog"  do 
	let (:b) {Blog.new}
	context "Post created for blog" do
		post1=Post.new("Hey ho hello1","1st July 2015","This is my first blog")
		post2=Post.new("Hey ho hello2","2nd July 2015","This is my second blog")
		post3=Post.new("Hey ho hello3","3rd July 2015","This is my third blog")
		it "validates post title is created" do
			expect(post1.show_title).to eq("Hey ho hello1")
		end
		it "validates post date is created" do
			expect(post1.show_date).to eq(Date.parse("1st July 2015"))
		end
		it "validates post title is created" do
			expect(post1.show_text).to eq("This is my first blog")
		end
		it "validates that the blog includes correctly the posts" do
				b.add_post(post1)
				b.add_post(post2)
				b.add_post(post3)
				expect(b.posts.size).to eq(3)
		end
		it "validates that the method latest posts work" do
			b.add_post(post1)
			b.add_post(post2)
			b.add_post(post3)
			post1.update_date("1st July 2015")
			post2.update_date("1st July 2015")
			post3.update_date("2nd July 2015")
			expect(b.latest_posts).to match_array([post1,post3,post2])
		end
	end
end
		# it "validate email" do 
		# 	pwc = PasswordChecker.new("cvv@sdsses", "")

		# 	expect(pwc.valid_email?).to be false

		# end
		# it "validate email" do 
		# 	pwc = PasswordChecker.new("cvv.sdsses",