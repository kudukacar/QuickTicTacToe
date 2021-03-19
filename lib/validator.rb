class Validator
  def initialize(display)
    @display = display
  end
  def validate(selection, range)
    if selection.between?(1,range)
      selection
    else
      @display.output("Invalid entry")
      nil
    end
  end
end