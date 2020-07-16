class GameBoard  
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