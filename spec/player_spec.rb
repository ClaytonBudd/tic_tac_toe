require "./lib/player.rb"

describe Player do
  describe "update_player_moves" do
    it "adds input to moves array" do
      player = Player.new("X", "player_1")
      player.update_player_moves(1)
      expect(player.moves).to eq([1])
    end
  end
end