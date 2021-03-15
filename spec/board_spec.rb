require 'board'

RSpec.describe "Board" do
  describe "#record" do
    it "records and gets the players move on the board" do
      board = Board.new(Array.new(9))
      board.record(5, "X")

      expect(board.get(5)).to eq("X")
    end
  end

  describe "#is_available?" do
    it "returns false if the position is not available" do
      board = Board.new(Array.new(9))
      board.record(5, "X")

      expect(board.is_available?(5)).to eq(false)
    end

    it "returns true if the position is available" do
      board = Board.new(Array.new(9))
      board.record(5, "X")

      expect(board.is_available?(2)).to eq(true)
    end
  end
end