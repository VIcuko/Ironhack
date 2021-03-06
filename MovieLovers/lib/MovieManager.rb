require 'imdb'

class MovieManager
	def initialize(search)
		@search=Imdb::Search.new(search)
	end

	def get_posters
		results=Array.new(9)
		results.map! do 
			pick_movie
		end
	end

	def pick_movie
		@search.movies.shuffle!
		@search.movies.each do |movie| 
			x=0
			if movie.poster.nil? 
				x+=1 
			else
				output = (@search.movies[x].poster)
				@search.movies.take(x)
			end
		end
	end