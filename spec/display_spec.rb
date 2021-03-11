require 'display'

RSpec.describe "Display" do
  class StdoutWithPuts
    attr_reader :outputs
    def initialize
      @outputs = ""
    end
    def puts(message)
      @outputs += message
    end
  end
  describe "output" do
    it "displays the given message" do
      stdout = StdoutWithPuts.new
      display = Display.new(stdout)
      display.output("Board")

      expect(stdout.outputs).to include("Board")
    end
  end
end