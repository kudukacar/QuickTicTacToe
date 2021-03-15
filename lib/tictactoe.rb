require_relative "./display"
require_relative "./presenter"
require_relative "./player"
require_relative "./board"

class TicTacToe
  attr_reader :stdout
  def initialize(display, presenter, players, board)
    @display = display
    @presenter = presenter
    @board = board
    @players = players
  end

  def run
    show_board
    @players.cycle(1) do |player|
      play_turn(player)
      show_board
    end
  end

  def show_board
    @display.output(@presenter.present(@board))
  end

  def play_turn(player)
    @board.record(player.selection(@display, @board), player.token)
  end
end

if $PROGRAM_NAME == __FILE__
  display = Display.new($stdout, $stdin)
  presenter = Presenter.new
  board = Board.new(Array.new(9))
  players = [Player.new("X"), Player.new("O")]
  TicTacToe.new(display, presenter, players, board).run
end