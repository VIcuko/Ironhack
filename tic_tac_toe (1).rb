require 'pry'

=begin First we ask the user for the length of the grid. Since it's a square, we will only need the size of one side of the square.
=end

class Player 
	attr_accessor(:name,:code,:last_play)
	def initialize (name, code)
		@name=name
		@code=code
		@last_play=[]
	end
end

def grid_size
	puts "\nHello!! Welcome to Tic Tac Toe!!\nPlease introduce the size of the grid for playing:"
	grid_size0=gets.chomp.to_i
	while grid_size0 <= 2
		puts """\nPlease, introduce a size greater than 2 to make the game a little\nbit interesting. Thank you! :)"""
		puts "Grid size:"
		grid_size0=gets.chomp.to_i
	end
	return grid_size0
end

def players_amount(grid_size1)
	puts """\nPlease indicate how many players will participate in the game.
Bear in mind that the size of the grid should be greater than the number
of players at least in 1:"""
	playnum1=gets.chomp.to_i
	while playnum1 >= (grid_size1)
	puts """\nThe number of players is not valid. Bear in mind that the size of the
grid should be greater than the number of players at least in 1.
Please introduce the number of players again:"
	playnum1=gets.chomp.to_i
	end
	return playnum1
end

def player_key(players1,playnum2)

	for player_number in 1..playnum2
		puts """\nIntroduce the key for Player#{player_number} (i.e. 'X' or 'O'):"""
		key=gets.chomp.to_s
		
		while key.size!=1
		"""\nPlease introduce a key with length 1.
	Introduce the key for Player#{player_number}:"""
		key=gets.chomp.to_s
		end

		players1[player_number-1]= Player.new("Player#{player_number}",key)
	end
end

def game_style
	puts """\nPlease choose the game style:
0.Infinite play
1.Fill the board"""
	style1=gets.chomp.to_i
	while style1.size!=1
		"""\nPlease introduce a game style by the number at the beginning (i.e. '1' for Fill the board style)."""
		style1=gets.chomp.to_i
	end
	return style1
end

def beginning_player(players2,playnum3)
	continue=false
		puts "\nPlease choose an option:\n0.Random"
		for count in 1..players2.size
			puts "#{count}.Player#{count}"
		end
		while continue=false
		beginner=gets.chomp.to_i
			if beginner.size!=1
				continue=false
				puts "Please introduce the number at the beginning to choose a specific option."
			elsif beginner<0 
				continue=false
				puts "Please introduce the number at the beginning to choose a specific option."		
			elsif beginner>total_count
		 		continue=false
		 		puts "Please introduce the number at the beginning to choose a specific option."
		 	else
		 		continue=true
		end

		case beginner
			when 0 
				actual_player1=1+rand(playnum3)
			when beginner!=0
				actual_player1=beginner
		end

		return actual_player1
end

def create_grid (grid_size2)
	game_board1=Array.new(grid_size2+1)
	i=64
	for count in 0..grid_size2
		game_board1[count]=Array.new(grid_size2+1)
		if i==64
			game_board1[0][count]=""
			game_board1[count][0]=""	
		else 
			game_board1[0][count]=count
			game_board1[count][0]=i.chr
		end	
		i+=1
	end
	return game_board1
end

def grid_print(game_board2,grid_size3)
	for count in 0..grid_size3
		puts "#{game_board2[count]}"
	end
end

def space_check(game_board3,winner1)
	unless game_board3.include?(nil)
		"There are no spaces left!"
		winner1=true
	end
	return winner1
end

def players_choice (players3,actual_player2)
	puts "#{players[actual_player2].name} introduce the line (A...):"
	line=gets.chomp.ord.to_i
	while line<65 || line>90
		puts "Please indicate a valid line value:"
		line=gets.chomp.ord.to_i-64
	end
	puts "#{players[actual_player2].name} introduce the column (1,...):"
	column=gets.chomp.to_i
	while column<1 || column>grid_size1
		puts "Please indicate a valid column value:"
		column=gets.chomp.to_i
	end
	playing_choice1=[line,column]
	return playing_choice1
end

def check_if_empty(game_board4,playing_choice1)
	game_board4[playing_choice1[0]][playing_choice1[1]]? do empty1=false
	end
	return empty1
end

def fill_if_empty(game_board5,playing_choice2,players4,actual_player3)
	game_board5[playing_choice[0]][playing_choice[1]]=players[actual_player].key
	return game_board5
end

def inform_player_history(style2,players5,actual_player4,grid_size4,playing_choice3)
	case style2
		when 0
			if	players5[actual_player4].length	<grid_size4
				players5[actual_player4].last_play.push(playing_choice3)
			else
				players5[actual_player4].last_play.shift
				players5[actual_player4].last_play.push(playing_choice3)
			end
		when 1
			players5[actual_player4].last_play.push(playing_choice3)
	end
end

def update_grid (game_board6,players6)
	for field in 1..game_board6.size-1
		for field2 in 1..game_board6.size-1
			game_board6[field][field2]=nil
		end
	end
	for player_count in 0..players6.length
		for player_count2 in 0..players6[player_count].length
			game_board6[players6[player_count][player_count2][0]][players6[player_count][player_count2][1]]=players6[player_count].key
		end
	end
	return game_board6
end

# --------------- Here begins the interaction with the user -----------------------

grid_size=grid_size()
playnum=players_amount(grid_size)
players= []

### Here we ask the player to define the keys to play the game:

player_key(players,playnum)

### Here we ask the player to choose the game style:

style = game_style

puts "Let's begin playing!"
puts "Who wants to begin?"

### Here we prompt the user to choose an option between Random (0) or select a specific player to start the game with and we store the player starting in the variable player_turn

actual_player = beginning_player(players,playnum)

### Here we begin with the game

winner=false
keep_playing=true

while keep_playing==true
	
	game_board=create_grid(grid_size)

	for count in 0..playnum-1
		players[count].last_play.clear
	end

	while winner==false

### We begin the game by showing the empty grid.
	
		grid_print(game_board,grid_size)

### Here it verifies if there are any empty spaces in the grid, if there aren't any, the game is finished:

		winner=space_check(game_board)

		empty=false
		while empty=false

### Here the user begins to choose where to put the key in the grid.

		playing_choice=players_choice(players,actual_player)

### Here it checks if the indicated position is empty and fills it in if it is:

		empty=check_if_empty(game_board,playing_choice)
		end

		game_board=fill_if_empty(game_board,playing_choice,players,actual_player)

### Here it fills in the player's history of moves depending on the game style

		inform_player_history(style,players,actual_player,grid_size,playing_choice)


### Here it updates the grid with the players choices:

		game_board=update_grid (game_board,players)

### Here it validates if the player has won:

def winning_validation(game_board7)
	winning_board=[]
	
### First we validate if the line contains the same values:
	for counter in 1..game_board7.size-1
		for counter2 in counter..game_board7.size-1
		end
	end

### Second we validate the columns
	for counter4 in 1..game_board7.size-1
		for counter3 in counter..game_board7.size-1

		end
	end

### Third we validate the diagonals



end



### Here it jumps to the next player:

		binding.pry
		winner=true
	end

	puts "Do you want to play again? (1=yes, 0=no):"
	keep_playing_choice=gets.chomp.to_i
	if (keep_playing_choice!=1 || keep_playing_choice!=0)
		keep_playing_choice=0
	end

### Here we define the cases for the player to play again or just leave.	
	case keep_playing_choice
		when 0
			puts "Thank you for playing Tic Tac Toe!"
			keep_playing=false
		when 1
			puts "Alright! Let's give it another try!"
	end
end