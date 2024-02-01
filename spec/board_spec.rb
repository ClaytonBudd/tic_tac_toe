require "./lib/board.rb"


describe Board do
  describe "#valid_move" do
    context "when input allowed" do
      it "returns true" do
        expect (subject.valid_move?(1))
      end
    end
  end
    context "when invalid input" do
      it "checks if input allowed" do
        !expect (subject.valid_move?(0))
      end
    end


  describe '#remove_availible_moves' do
    context "valid move given" do   
      it 'removes an integer from @availible_moves' do
        subject.remove_availible_moves(1)
        expect(subject.availible_moves).to eq([2,3,4,5,6,7,8,9])
      end
    end

    context "invalid move given" do
      it 'returns nil' do
        expect(subject.remove_availible_moves(10)).to eq(nil)
      end
    end

  end

   
  describe 'mark_board' do
    context 'marker is X' do
      it 'updates the board with X' do
        marker = "X"
        subject.mark_board(1,marker)
        expect(subject.board).to eq("[\"X\", 2, 3]"+"\n"+"[4, 5, 6]"+"\n"+"[7, 8, 9]"+"\n")
      end
    end

    context 'marker is O' do
      it 'updates the board with O' do
        marker = "O"
        subject.mark_board(5,marker)
        expect(subject.board).to eq("[1, 2, 3]" +"\n"+ "[4, \"O\", 6]" +"\n" +"[7, 8, 9]"+"\n")
      end
    end

    context 'marker is neither X or O' do
      it 'isnt a valid input returns board untouched' do
        marker = "X"
        subject.mark_board(10, marker)
        expect(subject.board).to eq("[1, 2, 3]" + "\n" +"[4, 5, 6]"+"\n"+"[7, 8, 9]"+"\n")
      end
    end
  end

  describe 'print_board' do
    context 'board is unmarked' do
      it 'displays the board in terminal' do
      expect(subject.board).to eq("#{[1,2,3]}" + "\n" + "#{[4,5,6]}" + "\n" + "#{[7,8,9]}" + "\n")
      end
    end

    context 'board is marked' do
      it 'displays marked board in terminal' do
        marker = "X"
        subject.mark_board(1, marker)
        expect(subject.board).to eq("#{["X",2,3]}" + "\n" + "#{[4,5,6]}" + "\n" + "#{[7,8,9]}" + "\n")
      end
    end
  end

  describe "player_input" do
    
    before do
      $stdin = StringIO.new("1")
    end

    after do
      $stdin = STDIN
    end

    it "gets input from terminal" do
      player_1 = double("player1")
      expect(subject.player_input(player_1)).to eq(1)
    end
  end
end
