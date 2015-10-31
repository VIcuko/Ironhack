class Game < ChessBoard

	def load_game(file)
		load=Load.new(file)
		game_to_load=load.load_to_game
		overwrite_game(game_to_load)
	end	
	
	def overwrite_game(game_to_load)
		game_to_load.each_with_index do |line,line_index|
			line.each_with_index do |field,field_index|
				@board[line_index+1][field_index+1]=field
			end
		end
	end
end