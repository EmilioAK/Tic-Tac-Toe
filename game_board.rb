require_relative 'game_rules.rb'

class GameBoard
  include GameRules
  attr_reader :board
  
  def initialize
    @board = Array.new(3) { Array.new(3, [" "]) }
  end
  
  def print_board
      @board.each { |row| p row }
  end

  def insert_piece(piece, row, cell)
    cell_to_place = @board[row][cell]
    
    if valid_placement?(cell_to_place)
        piece == 0 ? piece = "X" : piece = "O"
        @board[row][cell] = [piece] # I have to re-assign it this way for some reason. Ruby doesn't let me re-assign using the variable.
    else
        raise "Cell was already filled"
    end
  end
end