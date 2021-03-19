require 'validator'

RSpec.describe "Validator" do
  describe "#validate" do
    it "returns the selection if between given range" do
      display = DisplayWithOnlyOutput.new
      validator = Validator.new(display)
      selection = 8
      range = 9

      expect(validator.validate(selection, range)).to eq(8)
    end

    it "displays a message if selection not between given range" do
      display = DisplayWithOnlyOutput.new
      validator = Validator.new(display)
      selection = 8
      range = 5
      validator.validate(selection, range)

      expect(display.outputs).to match_array(['Invalid entry'])
    end
  end
end