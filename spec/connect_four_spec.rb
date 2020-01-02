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
  let(:board) { Board.new }
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

  describe "#check_win" do
    it "wins with 4 in a vertical row" do
      4.times { board.add_to_board(board.col1, "Y") }
      expect(game.check_win).to be_truthy
    end

    it "wins with 4 in a horizontal row" do
      board.add_to_board(board.col1, "R")
      board.add_to_board(board.col2, "R")
      board.add_to_board(board.col3, "R")
      board.add_to_board(board.col4, "R")
      expect(game.check_win).to be_truthy
    end

    it "wins with 4 in a diagonal row" do
      board.add_to_board(board.col1, "Y")
      board.add_to_board(board.col2, "R")
      board.add_to_board(board.col2, "Y")
      2.times { board.add_to_board(board.col3, "R") }
      board.add_to_board(board.col3, "Y")
      3.times { board.add_to_board(board.col4, "R") }
      board.add_to_board(board.col4, "Y")
      p board.display_board
      expect(game.check_win).to be_truthy
    end
  end


end  