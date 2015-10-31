class Game < ChessBoard
	def initialize
		super(board)
	end

	def load_game(file)
		loading_array=new.Load(file)
	end	
	
end