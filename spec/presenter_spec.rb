require 'presenter'

RSpec.describe "Presenter" do
  class BoardWithOneMethod
    def initialize(board)
      @board = board
    end
    def get(position)
      @board[position - 1]
    end
    def outcome
      "X wins"
    end
  end
  describe "present" do
    it "formats the board and outcome" do
      board = BoardWithOneMethod.new(["X", "O", "X", "O", "X", "O", "X", "O", "X"])
      presenter = Presenter.new
      expected_board = <<~BOARD
       X | O | X 
      ---+---+---
       O | X | O 
      ---+---+---
       X | O | X 
      BOARD
      expected_outcome = "\n#{board.outcome}"
      expect(presenter.present(board)).to include(expected_board + expected_outcome)
    end
  end
end