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

  def game_over?
    (winner or draw?) ? true : false
  end

  def winner
    (rows + columns + diagonals).each do |line|
      token = get(line.first)   
      return token if line.all? { |position| get(position) == token }
    end
    nil
  end

  def draw?
    not(winner) and not(@board.any?(&:nil?))
  end

  def rows
    [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def columns
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end

  def diagonals
    [[1, 5, 9], [3, 5, 7]]
  end
end