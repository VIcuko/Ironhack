class Pawn
	def initialize
		@name="Pawn"
	end

	def validate_move (origin,destiny)
		destiny[0]-origin[0]==1 && destiny[1]==origin[1]
	end
end