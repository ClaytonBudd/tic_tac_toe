class Player 
  attr_accessor :marker, :player_id, :moves

  def initialize(marker, player_id)
    @marker = marker
    @player_id = player_id
    @moves = []
  end

  def update_player_moves(input)
    if input > 0 && input < 10 
      @moves.push(input)
    end
  end

end