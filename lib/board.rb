class Board
  def initialize(board)
    @board = board
  end

  def record(selection, token)
    @board[selection - 1] = token
  end

  def get(position)
    @board[position - 1]
  end

  def is_available?(position)
    @board[position - 1].nil?
  end
end