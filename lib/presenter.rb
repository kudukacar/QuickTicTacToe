class Presenter
  def present(board)
    <<~BOARD
       #{get_cell(board, 1)} | #{get_cell(board, 2)} | #{get_cell(board, 2)} 
      ---+---+---
       #{get_cell(board, 2)} | #{get_cell(board, 2)} | #{get_cell(board, 2)} 
      ---+---+---
       #{get_cell(board, 2)} | #{get_cell(board, 2)} | #{get_cell(board, 2)} 
      BOARD
  end

  def get_cell(board, position)
    board.get(position) or " "
  end
end
