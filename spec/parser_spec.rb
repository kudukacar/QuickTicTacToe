require 'parser'

RSpec.describe 'Parser' do
  describe "#to_integer" do
    it "converts and string integer to the integer equivalent" do
      parser = Parser.new

      expect(parser.to_integer("7")).to eq(7)
    end

    it "returns 0 if given a string non-integer" do
      parser = Parser.new

      expect(parser.to_integer("?")).to eq(0)
    end
  end
end