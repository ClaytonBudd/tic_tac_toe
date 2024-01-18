require "./lib/game.rb"
require "./lib/board.rb"

describe Game do
  describe "next_player" do
    it "changes player_1 to player_2" do
      game = Game.new
      game.next_player(game.player_1)
      expect(game.current_player).to eq(game.player_2)
    end

    it "changes player_2 to player_1" do
      game = Game.new
      game.next_player(game.player_2)
      expect(game.current_player).to eq(game.player_1)
    end
  end

  describe "win?" do
    it "returns true because win condition met" do
      game = Game.new
      win_conditions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]      
      player_selections = [1,2,3]
      expect(game.win?(win_conditions, player_selections))
    end

    it "returns false because win condition not met" do
      game = Game.new
      win_conditions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]      
      player_selections = []
      !expect(game.win?(win_conditions, player_selections))
    end
  end

  describe "play_game" do
    it "should call play_round" do
      game = Game.new
      board = Board.new
      expect(game.play_game).to receive(:play_round)
    end
  end


end