require_relative 'game_board.rb'
require_relative 'game_rules.rb'

class Round
    include GameRules
    
    def initialize
        @whos_turn = 1 # Is either 0 or 1
        @game_board = GameBoard.new
    end

    def increment_turn
        @whos_turn = (@whos_turn + 1) % 2
    end

    def get_user_input
      @game_board.print_board
      print "Enter placement: "        
      user_input = gets.chomp.split(",").map(&:to_i) # Makes the input a list of ints
      puts "" # Newline after since it looks nicer
      
      return user_input
    end

    def play_turn
        user_input = get_user_input
        begin
            @game_board.insert_piece(@whos_turn, *user_input)
        rescue => placement_error
            puts placement_error
            play_turn # This solution prevents increment_turn from running
        end
    end

    def play_round
        until round_won?(@game_board.board) || board_filled?(@game_board.board) do
            increment_turn
            play_turn 
        end

        if tie?(@game_board.board)
            puts "Round was tied! No one got points!"
            return "Tie"
        else
            puts "Player #{@whos_turn + 1} won!"
            return @whos_turn + 1
        end
    end
end