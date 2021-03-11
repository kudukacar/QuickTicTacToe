require 'tictactoe'

RSpec.describe "TicTacToe" do
  class DisplayWithOnlyOutput
    attr_reader :outputs
    def initialize
      @outputs = "";
    end
    def output(message)
      @outputs += message
    end
  end

  class PresenterWithFormattedBoard
    def present
      "Formatted Board"
    end
  end
  
  describe "#run" do
    it "displays a welcome message" do
      display = DisplayWithOnlyOutput.new
      presenter = PresenterWithFormattedBoard.new
      tictactoe = TicTacToe.new(display, presenter)
      tictactoe.run

      expect(display.outputs).to include("Board")
    end
  end
end