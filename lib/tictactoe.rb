require_relative "./display"
require_relative "./presenter"

class TicTacToe
  attr_reader :stdout
  def initialize(display, presenter)
    @display = display
    @presenter = presenter
  end

  def run
    @display.output(@presenter.present)
  end
end

if $PROGRAM_NAME == __FILE__
  display = Display.new($stdout)
  presenter = Presenter.new
  TicTacToe.new(display, presenter).run
end