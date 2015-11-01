class Rook
	def initialize(name="wR",colour="w")
		@name="Rook"
		@colour=colour
		@board_name=name
	end

	def validate_move? (origin,destiny)
		origin[0]==destiny[0] || origin[1]==destiny[1]   
	end

end