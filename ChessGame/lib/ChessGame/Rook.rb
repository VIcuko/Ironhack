class Rook
	def initialize
		@name="Rook"
	end

	def validate_move? (origin,destiny)
		origin[0]==destiny[0] || origin[1]==destiny[1]   
	end

end