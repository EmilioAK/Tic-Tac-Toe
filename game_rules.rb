class Array
  def same_values?
    self.uniq.length == 1
  end
end

module GameRules
  def winning_line?(board)
    board.each do |line|
      if line.all? { |cell| cell == [" "] }
        return false
      end
      if line.same_values?
        return true
      end
    end
      return false
  end

  def row_won?(board)
    return winning_line?(board)
  end

  def column_won?(board)
    columns = board.transpose
    return winning_line?(columns)
  end

  def diagonal_won?(board)
    first_diagonal = (0..2).collect { |i| board[i][i] }
    second_diagonal = (0..2).collect { |i| board.reverse[i][i] }

    diagonals = [first_diagonal, second_diagonal]
    return winning_line?(diagonals)
  end

  def round_won?(board)
    if row_won?(board) || column_won?(board) || diagonal_won?(board)
      return true
    end
    return false
  end
end