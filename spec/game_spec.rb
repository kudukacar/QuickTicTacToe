require 'game'
require 'validator'

RSpec.describe "Game" do

  class InputParser
    def to_integer(input)
      input
    end
  end

  describe "#choose_game" do
    context "with a response not within the number of game choices" do
      it "prompts the player for a selection until getting a valid response" do
        display = DisplayWithInputandOutput.new([10, 0, 2])
        parser = InputParser.new
        validator = Validator.new(display)
        game = Game.new(display, parser, validator, {"1" => "", "2" => ""})
        game.choose_game

        expect(display.messages).to match_array(["Please select your game choice[1, 2]:  1 2", "Invalid entry", "Please select your game choice[1, 2]:  1 2", "Invalid entry", "Please select your game choice[1, 2]:  1 2"])
      end
    end

    context "with a response within the number of game choices" do
      it "returns the game choice reflecting the players selection" do
        display = DisplayWithInputandOutput.new([2])
        parser = InputParser.new
        validator = Validator.new(display)
        game = Game.new(display, parser, validator, {"1" => [1, 2], "2" => [2, 1]})

        expect(game.choose_game).to eq([2, 1])
      end
    end
    
  end
end