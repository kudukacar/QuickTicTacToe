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
      board.get(1) or "_"
    end
  end

  class BoardWithTwoMethods
    def initialize(board)
      @board = board
    end
    def record(move, token)
      @board.push(token)
    end
    def get(position)
      @board[position - 1]
    end
  end

  class PlayerWithOneSelection
    attr_reader :token
    def initialize(token)
      @token = token
    end
    def selection(display)
      1
    end
  end
  
  describe "#run" do
    it "shows every state of the board" do
      display = DisplayWithOnlyOutput.new
      presenter = PresenterWithFormattedBoard.new
      player = PlayerWithOneSelection.new("X")
      board = BoardWithTwoMethods.new([])
      tictactoe = TicTacToe.new(display, presenter, player, board)
      tictactoe.run

      expect(display.outputs).to eq(["_", "X"])
    end
  end
end