class ComputerPlayer
  attr_reader :token
  
  def initialize(token)
    @token = token
  end

  def selection(board)
    (1..9).each do |position|
      return position if board.is_available?(position)
    end
  end
end