require 'board'

RSpec.describe "Board" do
  describe "#record" do
    it "records and gets the players move on the board" do
      board = Board.new(Array.new(9))
      board.record(1, "X")

      expect(board.get(1)).to eq("X")
    end
  end
end