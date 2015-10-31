class Game < ChessBoard
	@players=["white","black"]

	def load_game(file="Standard_begin.txt")
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

	def welcome
		puts """Welcome to the Chess Master!!\nLet's begin the game!!\n"""
		game.show_board
		puts "Whites always begin!!"
	end

	def ask_for_move
		puts "Please introduce the origin field:"
		origin=gets.chomp
		puts "Please introduce the destiny field:"
		destiny=gets.chomp
		return [origin,destiny]
	end

	def move_piece (origin,destination)
		origin_field=position_converter(origin)
		destination_field=position_converter(destination)
	end

	def show_player
		@player[0]
	end

	def next_player
		@players.rotate!
	end

end