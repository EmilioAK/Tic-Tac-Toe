class Array
  def same_values?
    self.uniq.length == 1
  end
end

module GameRules
  $empty_cell = [" "]
  
  def valid_placement?(cell)
    return cell == $empty_cell
  end
  
  def winning_line?(board)
    board.each do |line|
      if line.all? { |cell| cell == $empty_cell }
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

  def board_filled?(board)
    board.each do |line|
      if line.any? { |cell| cell == $empty_cell }
        return false
      end
    end
    return true
  end

  def round_won?(board)
    return row_won?(board) || column_won?(board) || diagonal_won?(board)
  end

  def tie?(board)
    if board_filled?(board) && !round_won?(board)
      return true
    end
    return false
  end
end