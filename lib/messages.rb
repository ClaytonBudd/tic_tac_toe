class Messages

  def start_of_round_message(game, board)
    puts "#{board.board}"
    puts "#{game.current_player.player_id}" + " - Please select a space to mark: "
  end

  def invalid_selection(board)
    puts "#{board.board}"
    puts "*-------invalid selection try again-------*"
  end

  def win(game, board)
    puts "#{board.board}"
    puts "#{game.current_player.player_id}" + " Wins!"
  end

end