#server.rb
require_relative "lib/SinatraBlog.rb"
require 'sinatra'
require "sinatra/reloader" if development?
require 'pry'

blog = Blog.new
blog.add_post Post.new("Hey ho hello1","1st July 2015","This is my first post")
blog.add_post Post.new("Hey ho hello2","2nd July 2015","This is my second post")
blog.add_post Post.new("Hey ho hello3","3rd July 2015","This is my third post")

get '/blog' do
	@posts=blog.latest_posts
  erb :blog
end

get '/posts/:id' do
	id=params[:id]
	@post=blog.latest_posts[params[:id].to_i]
	erb :post
end

get '/add_post' do
	erb :add_post
end

post '/add_post' do
	title=params[:TITLE].to_s
	date=Time.new.to_s
	content=params[:CONTENT].to_s
	blog.add_post(Post.new(title,date,content))
	redirect to '/blog'
end

post '/create_todo' do
  todo = Todo.new(params[:content], params[:time])
  joshs_todos.add_todo(todo)
  redirect('/todos')
end