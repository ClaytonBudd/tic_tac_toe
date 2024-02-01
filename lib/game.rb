require_relative "board.rb"
require_relative "player.rb"
require_relative "messages.rb"

class Game 
  attr_accessor :current_player, :player_1, :player_2


  def initialize()
    @player_1 = Player.new("X", "Player_1")
    @player_2 = Player.new("O", "Player_2")
    @current_player = [@player_1, @player_2].sample
    @board = Board.new
    @messages = Messages.new
    @turns = 0
  end

  def play_round
    
    @messages.start_of_round_message(self, @board)
    next_player(@current_player)
    input = @board.player_input(@current_player)

    while @board.valid_move?(input) != true
      @messages.invalid_selection(@board)
      input = @board.player_input(@current_player)
    end
    @board.mark_board(input, @current_player.marker)
    @current_player.update_player_moves(input)

    
    @turns +=1
  end

  def draw
    puts "\n" + "-------It's a draw, Play again-------" + "\n" + "\n"
    game = Game.new
    game.play_game
  end

  def play_game 
    while !win?
      
      if @turns >= 8
        draw
        break
      else  
        play_round
      end
    
    end
    @messages.win(self, @board)
  end

  def win?() 
    index = 0
    8.times do
      if (@board.win_conditions[index] - @current_player.moves).empty?
        return true
      else
        index +=1
      end
    end
    return false
  end    

  def next_player(current_player)
    if current_player == @player_1
        @current_player = @player_2
    else @current_player = @player_1
  end

end
end

# game = Game.new
# game.play_game