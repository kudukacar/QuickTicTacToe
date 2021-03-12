class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end
  def selection(display)
    loop do
      display.output("Please select your move")
      input = display.input
      selection = to_integer(input)
      selection.between?(1, 9) ? (return selection) : display.output("Invalid entry")
    end
  end

  def to_integer(input)
    Integer(input) rescue 0
  end
end