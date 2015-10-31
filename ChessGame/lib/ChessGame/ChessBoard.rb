class ChessBoard
	def initialize
		@board=Array.new(9) {Array.new (9)}
	end

	def create_board_structure
		create_headers
		create_column_numbers
	end

	def create_headers
		@board[0].each_index do |index|
			index>0 ? (@board[0][index]=(96+index.ord).chr):(@board[0][index]="")
		end
	end

	def create_column_numbers
		@board.each_index do |index|
			index>0 ? (@board[index][0]=9-index):(@board[index][0]="")
		end
	end

	def show_board
		@board.each do |line|
			line.each do |field|
				print "#{field} "
			end
			puts ""
		end
	end

	def position_converter(position)
		conversion=Array.new(2)
		position_array=position.split
		conversion[0]=position_array[0].ord-"a".ord
		conversion[1]=9-position_array[0].to_i
		return conversion
	end	
end