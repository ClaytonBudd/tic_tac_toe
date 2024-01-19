class Board 
  attr_accessor :availible_moves, :board, :win_conditions

  def initialize()
    @availible_moves = [1,2,3,4,5,6,7,8,9]
    @board = [[1,2,3],[4,5,6],[7,8,9]]
    @win_conditions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]
  end

  def valid_move?(input)
    return true if @availible_moves.include?(input)

    false
  end

  def remove_availible_moves(move)
    @availible_moves.delete(move)
  end

  def mark_board(input, current_marker)
    @board.map{ |row| row.map! { | x | x == input ? current_marker : x }}
  end

  def board()
    return "#{@board[0]}" + "\n" + "#{@board[1]}" + "\n" + "#{@board[2]}" + "\n"
  end

  def player_input(current_player)
    return gets.chomp.to_i
  end
end


#board = Board.new()
# board.play_game()

#board.print_board
