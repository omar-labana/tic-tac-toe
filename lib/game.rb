class GameState
  attr_reader :game_board, :game_state

  def initialize()
    # 9 Board Cells
    @game_board = *(1..9)
    @game_state = 'Pending'
  end
end