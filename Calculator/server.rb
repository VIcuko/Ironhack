# server.rb
require "sinatra"

get "/" do
	erb(:main)
end

post "/decide_operation" do
	op=params[:Operation]
	case op
		when "add"
			redirect to("/add")
		when "substract"
			redirect to("/substract")
		when "multiply"
			redirect to("/multiply")
		when "divide"
			redirect to("/divide")
	end
end

get "/add" do
  erb(:add)
end

post "/calculate_add" do
	# "Params data: " + params.inspect
	first=params[:first_value].to_f
	second=params[:second_value].to_f
	total=first+second
	"#{first} + #{second} = #{total}"
	# add numbers here
	# erb(:)
	end

get "/substract" do
	erb(:substract)
end

post "/calculate_substract" do
	# "Params data: " + params.inspect
	first=params[:first_value].to_f
	second=params[:second_value].to_f
	total=first-second
	"#{first} - #{second} = #{total}"
	# add numbers here
	# erb(:)
	end

get "/multiply" do
	erb(:multiply)
end

post "/calculate_multiply" do
	# "Params data: " + params.inspect
	first=params[:first_value].to_f
	second=params[:second_value].to_f
	total=first*second
	"#{first} x #{second} = #{total}"
	# add numbers here
	# erb(:)
	end

get "/divide" do
	erb(:divide)
end

post "/calculate_divide" do
	# "Params data: " + params.inspect
	first=params[:first_value].to_f
	second=params[:second_value].to_f
	total=first/second
	"#{first}/#{second} = #{total}"
	# add numbers here
	# erb(:)
	end

