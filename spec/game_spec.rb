require "./lib/game.rb"

describe Game do
  describe "next_player" do
    context "when current player is player_1" do
      it "current player changes to player_2" do
        subject.next_player(subject.player_1)
        expect(subject.current_player).to eq(subject.player_2)
      end
    end

    context "when current player is player_2" do
      it "changes current player to player_1" do
        subject.next_player(subject.player_2)
        expect(subject.current_player).to eq(subject.player_1)
      end
    end
  end
end