require 'board'

RSpec.describe "Board" do
  subject(:board) { Board.new(Array.new(9)) }

  def fill_board(positions, token)
    positions.each { |position| board.record(position, token) }
  end

  def create_in_progress_game
    fill_board([1, 5, 8], "X")
    fill_board([2, 4], "O")
  end

  def create_game_draw
    fill_board([2, 4, 5, 7, 9], "X")
    fill_board([1, 3, 6, 8], "O")
  end

  def create_row_winner
    fill_board([1, 2, 3], "X")
  end

  def create_column_winner
    fill_board([1, 4, 7], "X")
  end

  def create_diagnonal_winner
    fill_board([3, 5, 7], "X")
  end
  
  describe "#record" do
    it "records and gets the players move on the board" do
      board.record(5, "X")

      expect(board.get(5)).to eq("X")
    end
  end

  describe "#is_available?" do
    it "returns false if the position is not available" do
      board.record(5, "X")

      expect(board.is_available?(5)).to eq(false)
    end

    it "returns true if the position is available" do
      board.record(5, "X")

      expect(board.is_available?(2)).to eq(true)
    end
  end

  describe "#game_over?" do
    it "returns false when there is neither a draw nor a win" do
      create_in_progress_game

      expect(board.game_over?).to eq(false)
    end

    it "returns true with a draw" do
      create_game_draw

      expect(board.game_over?).to eq(true)
    end

    it "returns true with a row win" do
      create_row_winner

      expect(board.game_over?).to eq(true)
    end

    it "returns true with a column win" do
      create_column_winner      

      expect(board.game_over?).to eq(true)
    end

    it "returns true with a diagonal win" do
      create_diagnonal_winner

      expect(board.game_over?).to eq(true)
    end
  end
end