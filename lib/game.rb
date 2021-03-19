class Game
  def initialize(display, parser, validator, game_choices)
    @display = display
    @parser = parser
    @validator = validator
    @game_choices = game_choices
  end
  def choose_game
    loop do
      choices = @game_choices.keys
      range = choices.length
      @display.output("Please select your game choice[1, #{range}]:  #{choices.join(" ")}")
      selection = @parser.to_integer(@display.input)
      return @game_choices[choices[selection - 1]]if @validator.validate(selection, range)
    end
  end
end