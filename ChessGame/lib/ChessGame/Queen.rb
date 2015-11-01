class Queen
	def initialize(name="wQ",colour="w")
		@name="Queen"
		@colour=colour
		@board_name=name
	end

	def validate_move (origin,destiny)
		(destiny[0]-origin[0]).abs == (destiny[1]-origin[1]).abs
		origin[0]==destiny[0] || origin[1]==destiny[1]
	end
end