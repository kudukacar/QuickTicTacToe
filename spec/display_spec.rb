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

  class StdinWithGets
    def initialize(inputs)
      @inputs = inputs
    end
    def gets
      @inputs
    end
  end
  describe "output" do
    it "displays the given message" do
      stdout = StdoutWithPuts.new
      stdin = StdinWithGets.new("1")
      display = Display.new(stdout, stdin)
      display.output("Board")

      expect(stdout.outputs).to include("Board")
    end
  end

  describe "input" do
    it "reads the players input" do
      stdout = StdoutWithPuts.new
      stdin = StdinWithGets.new("1")
      display = Display.new(stdout, stdin)

      expect(display.input).to include("1")
    end
  end
end