require 'human_player'
require 'validator'

RSpec.describe "HumanPlayer" do
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

  class BoardWithIsAvailable
    def is_available?(selection)
      selection == 5
    end
  end

  class InputParser
    def to_integer(input)
      input
    end
  end

  describe "#selection" do
    context "with a response not within 1 and 9" do
      it "prompts the player for a selection until getting a valid and available one" do
        display = DisplayWithInputandOutput.new([10, 0, 5])
        board = BoardWithIsAvailable.new()
        parser = InputParser.new
        validator = Validator.new(display)
        player = HumanPlayer.new("X", display, parser, validator)
        player.selection(board)

        expect(display.messages).to match_array(["Please select your move", "Invalid entry", "Please select your move", "Invalid entry", "Please select your move"])
      end
    end

    context "with a response within 1 and 9 and not available" do
      it "prompts the player for a selection until getting a valid and available one" do
        display = DisplayWithInputandOutput.new([9, 1, 5])
        board = BoardWithIsAvailable.new()
        parser = InputParser.new
        validator = Validator.new(display)
        player = HumanPlayer.new("X", display, parser, validator)
        player.selection(board)

        expect(display.messages).to match_array(["Please select your move", "Selection not available", "Please select your move", "Selection not available", "Please select your move"])
      end
    end

    context "with a valid and available selection" do
      it "returns the selection" do
        display = DisplayWithInputandOutput.new([5])
        board = BoardWithIsAvailable.new()
        parser = InputParser.new
        validator = Validator.new(display)
        player = HumanPlayer.new("X", display, parser, validator)

        expect(player.selection(board)).to eq(5)
      end
    end
  end
end