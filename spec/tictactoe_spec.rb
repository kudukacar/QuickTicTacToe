require 'tictactoe'

RSpec.describe "TicTacToe" do
  class DisplayWithOnlyOutput
    attr_reader :outputs
    def initialize
      @outputs = [];
    end
    def output(message)
      @outputs.push(message)
    end
  end

  class PresenterWithFormattedBoard
    def present(board)
      (1..9).map { |position| board.get(position) or "" }.join
    end
  end

  class BoardWithMethods
    def initialize(board)
      @board = board
    end
    def record(move, token)
      @board.push(token)
    end
    def get(position)
      @board[position - 1]
    end

    def game_over?()
      @board.length == 9 ? true : false
    end

    def outcome
      "X wins"
    end
  end

  class PlayerWithManySelections
    attr_reader :token
    def initialize(token, selections)
      @token = token
      @selections = selections
    end
    def selection(board)
      @selections.shift
    end
  end

  
  describe "#run" do
    it "plays the game until it's over" do
      display = DisplayWithOnlyOutput.new
      presenter = PresenterWithFormattedBoard.new
      first_player = PlayerWithManySelections.new("X", [1, 3, 5, 7, 9])
      second_player = PlayerWithManySelections.new("O", [2, 4, 6, 8])
      board = BoardWithMethods.new([])
      tictactoe = TicTacToe.new(display, presenter, [first_player, second_player], board)
      tictactoe.run

      expect(display.outputs).to eq(["", "X", "XO", "XOX", "XOXO", "XOXOX", "XOXOXO", "XOXOXOX", "XOXOXOXO", "XOXOXOXOX", "X wins"])
    end
  end
end