class HumanPlayer
  attr_reader :token
  def initialize(token, display, parser, validator)
    @token = token
    @display = display
    @parser = parser
    @validator = validator
  end
  
  def selection(board)
    loop do
      @display.output("Please select your move")
      selection = @parser.to_integer(@display.input)
      return selection if @validator.validate(selection, 9) and selection_available(selection, board)
    end
  end

  private
  def selection_available(selection, board)
    if board.is_available?(selection)
      selection
    else 
      @display.output("Selection not available")
      nil
    end
  end
end