require_relative ("../lib/ChessGame.rb")

game = Game.new
game.create_board_structure
game.load_game("Standard_begin.txt")
binding.pry
