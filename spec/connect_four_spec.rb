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
    let(:game) { Game.new }

    # before do
    #   allow($stdout).to receive(:write)
    # end

    describe "Game" do
      it "initializes a board" do
        expect(game.board).to be_a Board
      end
    end

    describe "#player_setup" do
      it "set's up player 1's name as 'Ben'" do
        allow(game).to receive(:gets).and_return("Ben", "Emma", "red")
        game.setup_players
        expect(game.player1.name).to eql "Ben"
      end

      it "sets up player 2's name as 'Emma'" do
        allow(game).to receive(:gets).and_return("Ben", "Emma", "Yellow")
        game.setup_players
        expect(game.player2.name).to eql "Emma"
      end

      it "sets player 1's disc color to red" do
        allow(game).to receive(:gets).and_return("name", "name", "red")
        game.setup_players
        expect(game.player1.disc).to eql "R"
      end

    end
  end  

end