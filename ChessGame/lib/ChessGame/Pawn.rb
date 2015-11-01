class Pawn
	def initialize(name="wP",colour="w")
		@name="Pawn"
		@colour=colour
		@board_name=name
	end

	def validate_move? (origin,destiny)
		case @colour
			when "w"
				destiny[0]-origin[0]==1 && destiny[1]==origin[1]
			when "b"
				origin[0]-destiny[0]==1 && destiny[1]==origin[1]
		end
	end
end