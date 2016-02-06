class PostsController < ApplicationController

	def new
		@Post = Post.new
		@sitename = "Shorten your URL"
	end

	def show
		@Post=Post.find(params[:id])
	end








end
