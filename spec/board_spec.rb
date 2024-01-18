require "./lib/board.rb"
require "./lib/game.rb"
require "./lib/player.rb"

describe Board do
  describe "valid_move" do
    it "checks if input allowed" do
      board = Board.new
      expect (board.valid_move?(1))
    end
  end

    it "checks if input allowed" do
      board = Board.new
      !expect (board.valid_move?(0))
  end

  describe 'remove_availible_moves(move)' do
    it 'removes an integer from @availible_moves' do
      board = Board.new
      board.remove_availible_moves(1)
      expect(board.availible_moves).to eq([2,3,4,5,6,7,8,9])
    end
    it 'returns nil if invalid move entered' do
      board = Board.new
      expect(board.remove_availible_moves(10)).to eq(nil)
    end

  end

   
  describe 'mark_board' do
    it 'updates the board with X' do
      board = Board.new
      marker = "X"
      board.mark_board(1,marker)
      expect(board.board).to eq([["X",2,3],[4,5,6],[7,8,9]])
    end
    it 'updates the board with O' do
      board = Board.new
      marker = "O"
      board.mark_board(5,marker)
      expect(board.board).to eq([[1,2,3],[4,"O",6],[7,8,9]])
    end
    it 'isnt a valid input returns board untouched' do
      board = Board.new
      marker = "X"
      board.mark_board(10, marker)
      expect(board.board).to eq([[1,2,3],[4,5,6],[7,8,9]])
    end
end

  describe 'print_board' do
    it 'displays the board in terminal' do
      board = Board.new
      expect(board.print_board).to eq("#{[1,2,3]}" + "\n" + "#{[4,5,6]}" + "\n" + "#{[7,8,9]}" + "\n")
    end

    it 'displays marked board in terminal' do
      board = Board.new
      marker = "X"
      board.mark_board(1, marker)
      expect(board.print_board).to eq("#{["X",2,3]}" + "\n" + "#{[4,5,6]}" + "\n" + "#{[7,8,9]}" + "\n")
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
      board = Board.new
      player_1 = double("player1")
      expect(board.player_input(player_1)).to eq(1)
    end
  end
end
