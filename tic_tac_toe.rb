class Board 
  attr_accessor :current_player
  def initialize()
    @availible_selections = [1,2,3,4,5,6,7,8,9]
    @player_1 = Players.new("X", "Player_1")
    @player_2 = Players.new("O", "Player_2")
    @current_player = [@player_1, @player_2].sample
    @board = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
    @win_conditions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]
  end

  def valid_selection?(selection)
      if @availible_selections.include?(selection)
        @availible_selections.delete(selection)
        mark_board(selection)
        update_player_selections(selection)
      else
        print_board()
        puts "*----invalid selection try again-----*"
        player_input()
      end
  end 

  def update_player_selections(selection)
    @current_player.player_selections.push(selection)
  end

  def mark_board(selection)
    @board.map{ |row| row.map! { | x | x == selection ? @current_player.marker : x }}
  end

  def reset_board()
    @board = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
  end
  
  def play_game
    turns = 0
    while win?() == false
      if turns > 8
        puts "It's a draw, Play again"
        reset_board()
        play_game()
      else  
        next_player(@current_player) 
        print_board()
        player_input()
        turns += 1
      end
    end
    print_board()
    puts "#{@current_player.name}" + " Wins!"
  end

  def win?()
    index = 0
    8.times do 
      if (@win_conditions[index] - @current_player.player_selections).empty?    
        return true
      else
      index += 1
      end
    end
    return false
  end    
  
  def print_board()
    puts "#{@board[0]}" + "\n" + "#{@board[1]}" + "\n" + "#{@board[2]}" + "\n"
  end

  def player_input()
    puts "#{@current_player.name}" + " - Please select a space to mark: "
    selection = gets.chomp.to_i
    valid_selection?(selection)
  end

    def next_player(current_player)
      if @current_player == @player_1
          @current_player = @player_2
      else @current_player = @player_1
    end
  end
end

class Players < Board
  attr_accessor :name, :marker, :player_selections
  def initialize(marker, name)
    @name = name
    @marker= marker
    @player_selections = []
  end
end

board = Board.new()
board.play_game()

