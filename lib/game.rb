class GameState
  def initialize()
    # 9 Board Cells
    @game_board = *(1..9)
    @game_state = 'Pending'
  end
end