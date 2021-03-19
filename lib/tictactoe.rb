require_relative "./display"
require_relative "./presenter"
require_relative "./human_player"
require_relative "./board"
require_relative "./computer_player"
require_relative "./parser"
require_relative "./validator"
require_relative "./game"

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
    play_game
    show_outcome
  end

  private

  def show_board
    @display.output(@presenter.present(@board))
  end

  def show_outcome
    @display.output(@board.outcome)
  end

  def play_turn(player)
    @board.record(player.selection(@board), player.token)
  end

  def play_game
    @players.cycle do |player|
      play_turn(player)
      show_board
      break if @board.game_over?
    end
  end
end

if $PROGRAM_NAME == __FILE__
  display = Display.new($stdout, $stdin)
  presenter = Presenter.new
  board = Board.new(Array.new(9))
  parser = Parser.new
  validator = Validator.new(display)
  human_player = HumanPlayer.new("X", display, parser, validator)
  computer_player = ComputerPlayer.new("O")
  first_players_option = [human_player, computer_player]
  second_players_option = [computer_player, human_player]
  game_options = {"1. You go first" => first_players_option, "2. Computer goes first" => second_players_option}
  players = Game.new(display, parser, validator, game_options).choose_game
  TicTacToe.new(display, presenter, players, board).run
end