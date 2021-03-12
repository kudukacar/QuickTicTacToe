require_relative "./display"
require_relative "./presenter"
require_relative "./player"
require_relative "./board"

class TicTacToe
  attr_reader :stdout
  def initialize(display, presenter, player, board)
    @display = display
    @presenter = presenter
    @board = board
    @player = player
  end

  def run
    show_board
    play_turn
    show_board
  end

  def show_board
    @display.output(@presenter.present(@board))
  end

  def play_turn
    @board.record(@player.selection(@display), @player.token)
  end
end

if $PROGRAM_NAME == __FILE__
  display = Display.new($stdout, $stdin)
  presenter = Presenter.new
  player = Player.new("X")
  board = Board.new(Array.new(9))
  TicTacToe.new(display, presenter, player, board).run
end