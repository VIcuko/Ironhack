require_relative ("../lib/ChessGame.rb")

game = Game.new
game.create_board_structure
game.load_game
game.welcome
game.ask_for_move




binding.pry
