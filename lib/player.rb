class Player 
  attr_accessor :marker, :player_id

  def initialize(marker, player_id)
    @marker = marker
    @player_id = player_id
    @moves = []
  end

  def update_player_moves(input)
    @moves.push(input)
  end

end