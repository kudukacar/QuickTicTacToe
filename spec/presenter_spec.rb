require 'presenter'

RSpec.describe "Presenter" do
  describe "present" do
    it "formats a 3 x 3 board" do
      presenter = Presenter.new
      expected_board = <<~BOARD
        |  |
      --+--+--
        |  |
      --+--+--
        |  |
      BOARD
      expect(presenter.present).to include(expected_board)
    end
  end
end