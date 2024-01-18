require_relative "board"
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
  end

  def play_round
    
    messages.start_of_round
    next_player(@current_player)
    input = board.player_input(@current_player)

    
    if board.valid_selection(input)
      board.mark_board(input, @current_player.marker)
      update_player_selections(input)
    else
      messages.invalid_selection
      board.player_input
      turns += 1
    end
  end

  def draw
    puts "It's a draw, Play again"
    @board = Board.new
    play_game
  end

  def play_game 
    turns = 0
    while win?(board.win_conditions[index, current_player.selections]) == false
      
      if turns > 8
        draw
      else  
        play_round
      end
    
    end
    messages.win
  end

  def win?(win_conditions, player_selections) 
    index = 0
    8.times do 
      if (win_conditions - player_selections).empty?    
        return true
      else
      index += 1
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

game = Game.new