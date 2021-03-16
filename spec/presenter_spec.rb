require 'presenter'

RSpec.describe "Presenter" do
  class BoardWithOneMethod
    def initialize(board)
      @board = board
    end
    def get(position)
      @board[position - 1]
    end
  end
  describe "present" do
    it "formats the board" do
      board = BoardWithOneMethod.new(["X", "O", "X", "O", "X", "O", "X", "O", "X"])
      presenter = Presenter.new
      expected_board = <<~BOARD
       X | O | X 
      ---+---+---
       O | X | O 
      ---+---+---
       X | O | X 
      BOARD
      expect(presenter.present(board)).to include(expected_board)
    end
  end
end