class Load
	def initialize(file)
		@file=file
		@game_load=Array.new(8) {Array.new (8)}
	end
	
	def load_to_game
		file_array = load_into_array(@file)
		convert_to_board(file_array)
		clean_board
		load_pieces
		return @game_load
	end

	def load_into_array(file)
		IO.readlines(file)
	end

	def convert_to_board(file_clean)
		file_clean.each_with_index do |line,index|
			@game_load[index]=line.split(" ")
		end
	end

	def dispose_board
		@game_load.each do |line|
			line.each do |field|
				field.gsub!(/[\W+]/,' ')
			end
		end
	end

	def load_pieces
		@game_load.each_with_index do |line,line_index|
			line.each_with_index do |field,field_index|
				case field[1]
					when "K"
						piece="King"
					when "Q"
						piece="Queen"
					when "R"
						piece="Rook"
					when "B"
						piece="Bishop"
					when "N"
						piece="Knight"
					when "P"				
						piece="Pawn"
					else
				end
				@game_load[line_index][field_index]=(eval piece).new(field,field[1])
			end
		end
	end

end