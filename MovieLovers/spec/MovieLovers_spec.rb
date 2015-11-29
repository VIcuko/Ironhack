#MovieLovers_spec.rb
require './lib/MovieLovers.rb'

require 'pry'
# require_relative "../lib/SinatraBlog.rb"
require 'spec_helper'

describe "Obtain info from IMDB"  do 
	# let (:m) {Imdb::Search.new('')}
	context "The query receives information from Imdb" do
		it "receives an array of movies when looking up a title" do
			search_result=instance_double("MovieManager", :pick_movie => [#<Imdb::Movie:0x007fdda29e7c80
				  @id="0108778",
				  @title="Friends (1994) (TV Series)",
				  @url="http://akas.imdb.com/title/tt0108778/combined">])
			expect(MovieManager.new(search_result).pick_movie).to eq("Hey ho hello1")
		end
	end
end
