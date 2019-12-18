require './board.rb'
require './player.rb'
require './game.rb'

describe "Board" do
  let(:board) { Board.new }

  describe "#add_to_board" do
    it "adds disc to start of column" do
      expect(board.add_to_board(board.col1, "R")).to start_with ["R"]
    end

    it "adds disc to next available slot" do
      board.add_to_board(board.col1, "R")
      expect(board.add_to_board(board.col1, "Y")).to eql ["R", "Y", "-", "-", "-", "-"]      
    end
  end

  describe "Player" do
    describe "#initialize" do
      it "assigns a player with a name" do
        player = Player.new("David")
        expect(player.name).to eq "David"
      end
    end
  end

  describe "Game" do
    
  end

end