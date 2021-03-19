require 'computer_player'

RSpec.describe "ComputerPlayer" do
  class BoardWithOneAvailable
    def is_available?(position)
      position == 1
    end
  end
  describe "#selection" do
    it "selects an available position on the board" do
      computer_player = ComputerPlayer.new("O")
      board = BoardWithOneAvailable.new
      
      expect(computer_player.selection(board)).to eq(1)
    end
  end
end