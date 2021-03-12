require 'player'

RSpec.describe "Player" do
  class DisplayWithInputandOutput
    attr_reader :messages
    def initialize(inputs)
      @inputs = inputs
      @messages = []
    end
    def output(message)
      @messages.push(message)
    end
    def input
      @inputs.shift
    end
  end
  describe "#selection" do
    context "with a response not within 1 and 9" do
      it "prompts the player for a selection until getting a correct one" do
        display = DisplayWithInputandOutput.new([10, 0, 5])
        player = Player.new("X")
        player.selection(display)

        expect(display.messages).to match_array(["Please select your move", "Invalid entry", "Please select your move", "Invalid entry", "Please select your move"])
      end
    end
  end
end