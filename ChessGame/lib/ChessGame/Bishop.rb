class Bishop
	def initialize(name="wB",colour="w")
		@name="Bishop"
		@colour=colour
		@board_name=name
	end

	def validate_move? (origin,destiny)
		(destiny[0]-origin[0]).abs == (destiny[1]-origin[1]).abs
	end
end