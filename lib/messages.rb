require_relative "game.rb"
require_relative "board.rb"
require_relative "player.rb"

class Messages

  def start_of_round_message
    board.print_board
    puts "#{game.current_player}" + " - Please select a space to mark: "
  end

  def invalid_selection
    board.print_board
    puts "*-------invalid selection try again-------*"
  end

  def win
    board.print_board()
    puts "#{game.current_player.name}" + " Wins!"
  end

end