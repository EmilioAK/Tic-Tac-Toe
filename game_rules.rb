require_relative 'game_rules.rb'

class Board  
    attr_reader :board
    
    def initialize
        create_board
    end

    def create_board
        @board = Array.new(3) { Array.new(3, [" "]) }
    end
    
    def print_board
        @board.each { |row| p row }
    end

    def insert_piece(piece, row, cell)
        piece == 0 ? piece = "X" : piece = "O"
        @board[row][cell] = [piece]
    end
end

class Round
    include GameRules
    
    def initialize
        @whos_turn = 0 # Is either 0 or 1
        @boardInstance = Board.new
        @board = @boardInstance.board
    end

    def increment_turn
        @whos_turn = (@whos_turn + 1) % 2
    end

    def play_turn
        puts "Enter placement: "
        user_input = gets.chomp
        user_input_array = user_input.split(",")
        user_input_to_i = user_input_array.map(&:to_i)
        
        @boardInstance.insert_piece(@whos_turn, *user_input_to_i)
        increment_turn
        @boardInstance.print_board
        p row_won?(@board)
    end
end

round = Round.new
round.play_turn
round.play_turn
