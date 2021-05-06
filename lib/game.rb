class GameState
  attr_reader :game_board, :game_state

  def initialize()
    # 9 Board Cells
    @game_board = *(0..8)
    @game_state = 'Pending'
  end

  def valid_placement?(cell_number)
    return false if cell_number.is_a?(String) || cell_number.negative?

    return false if @game_board[cell_number].is_a?(String)

    return true if @game_board[cell_number].is_a?(Numeric) && @game_board.count(Numeric) <= 9

    false
  end

  def compare_cells?(cell1, cell2, cell3)
    cell1 == cell2 && cell2 == cell3
  end

  def check_diagonals?
    return true if compare_cells?(@game_board[0], @game_board[4], @game_board[8])
    return true if compare_cells?(@game_board[2], @game_board[4], @game_board[6])

    false
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

  def game_over?(_cell_number = nil)
    game_over = false
    # Full board

    game_over = true if check_diagonals? || check_rows? || check_cols?
    game_over = 'draw' if @game_board.none?(Numeric) && game_over == false
    game_over
  end

  def place_item(cell_number, player_name)
    @game_board[cell_number] = player_name
  end
end
