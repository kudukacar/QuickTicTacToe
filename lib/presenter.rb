class Presenter
  def present(board)
    <<~BOARD
       #{get_cell(board, 1)} | #{get_cell(board, 2)} | #{get_cell(board, 3)} 
      ---+---+---
       #{get_cell(board, 4)} | #{get_cell(board, 5)} | #{get_cell(board, 6)} 
      ---+---+---
       #{get_cell(board, 7)} | #{get_cell(board, 8)} | #{get_cell(board, 9)} 
      BOARD
  end

  def get_cell(board, position)
    board.get(position) or " "
  end
end
