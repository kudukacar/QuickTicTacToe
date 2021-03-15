class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end
  def selection(display, board)
    loop do
      display.output("Please select your move")
      selection = to_integer(display.input)
      return selection if selection_valid(selection, display) && selection_available(selection, display, board)
    end
  end

  def selection_valid(selection, display)
    if selection.between?(1,9) 
      selection
    else 
      display.output("Invalid entry")
      nil
    end
  end

  def selection_available(selection, display, board)
    if board.is_available?(selection)
      selection
    else 
      display.output("Selection not available")
      nil
    end
  end

  def to_integer(input)
    Integer(input) rescue 0
  end
end