require 'tictactoe'

RSpec.describe "TicTacToe" do
  class Stdout
    attr_reader :outputs
    def initialize
      @outputs = "";
    end
    def puts(message)
      @outputs += message
    end
  end
  
  describe "#run" do
    it "displays a welcome message" do
      stdout = Stdout.new
      tictactoe = TicTacToe.new(stdout)
      tictactoe.run

      expect(stdout.outputs).to include("Welcome ")
    end
  end
end