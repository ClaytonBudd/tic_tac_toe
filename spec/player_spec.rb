require "./lib/player.rb"

describe Player do
  describe "update_player_moves" do
    subject { described_class.new("X", "player_1")}
    
    context "when valid input given" do
      it "adds input to moves array" do
        subject.update_player_moves(1)
        expect(subject.moves).to eq([1])
      end
    end

    context "when invalid input given" do
      it "returns untouched moves array" do
        subject.update_player_moves(10)
        expect(subject.moves).to eq([])
      end
    end
  end
end