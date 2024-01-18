

class Game 
  attr_accessor :current_player, :player_1


  def initialize()
    @player_1 = Player.new("X", "Player_1")
    @player_2 = Player.new("O", "Player_2")
    @current_player = [@player_1, @player_2].sample
    @board = Board.new
  end

  def play_game 
    turns = 0
    while win? == false
      
      if turns > 8
        puts "It's a draw, Play again"
        @board = Board.new
        play_game
      else  
        next_player(@current_player) 
        board.print_board
        input = board.player_input(@current_player)
        
        if board.valid_selection(input)
          board.mark_board(input, @current_player.marker)
          update_player_selections(input)
        else
          print_board
          puts "*-------invalid selection try again-------*"
          player_input
          turns += 1
        end

      end
    end
    print_board()
    puts "#{@current_player.name}" + " Wins!"
  end

  def win?() 
    index = 0
    8.times do 
      if (board.win_conditions[index] - current_player.selections).empty?    
        return true
      else
      index += 1
      end
    end
    return false
  end    

  def next_player(current_player)
    if @current_player == @player_1
        @current_player = @player_2
    else @current_player = @player_1
  end

end
end