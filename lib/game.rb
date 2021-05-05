class GameState
  attr_reader :game_board, :game_state

  def initialize()
    # 9 Board Cells
    @game_board = *(1..9)
    @game_state = 'Pending'
  end

  def is_valid_placement?(cell_number, numer_of_used_cells)
    is_valid = nil
    if @game_board[cell_number].is_a?(Numeric) && numer_of_used_cells <= 9
      is_valid = true
    else
      is_valid = false
    end
    is_valid
  end

  def compare_cells?(cell_1, cell_2, cell_3)
    cell_1 == cell_2 && cell_2 == cell_3
  end

  def check_diagonals?
    return true if compare_cells?(@game_board[0], @game_board[4], @game_board[8])
    return true if compare_cells?(@game_board[2], @game_board[4], @game_board[6])
    return false
  end

  def check_cols?
    return true if compare_cells?(@game_board[0], @game_board[3], @game_board[6])
    return true if compare_cells?(@game_board[1], @game_board[4], @game_board[7])
    return true if compare_cells?(@game_board[2], @game_board[5], @game_board[8])

  end

  def check_rows?
    checker = false
    checker = true if compare_cells?(@game_board[0], @game_board[1], @game_board[2])
    checker = true if compare_cells?(@game_board[3], @game_board[4], @game_board[5])
    checker = true if compare_cells?(@game_board[6], @game_board[7], @game_board[8])
    checker
  end

  def is_game_over?(cell_number)
    game_over = false
    # Full board
    if !@game_board.any?(Numeric)
      game_over = true
    elsif check_diagonals?
      game_over = true
    elsif check_rows?
      game_over = true
    elsif check_cols?
      game_over = true
    end
    game_over
  end
end