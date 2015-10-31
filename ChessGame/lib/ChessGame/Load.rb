class Load
	def initialize(file)
		@file=file
		@game_load=Array.new(8) {Array.new (8)}
	end
	
	def load_to_game
		file_array = load_into_array
		convert_to_board(file_array)
		clean_board
		return @game_load
	end

	def load_into_array
		IO.readlines(@file)
	end

	def convert_to_board(file_clean)
		file_clean.each_with_index do |line,index|
			@game_load[index]=line.split(" ")
		end
	end

	def clean_board
		@game_load.each do |line|
			line.each do |field|
				field.gsub!(/[\W+]/,' ')
			end
		end
	end


end