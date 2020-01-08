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
  let(:player1) { game.player1 = Player.new("Sarah") }
  let(:player2) { game.player2 = Player.new("Dave") }

  before do
    allow($stdout).to receive(:write)
  end

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

  describe "#check_vertical" do
    it "wins with 4 in a vertical row" do
      player1.disc = "Y"
      4.times { game.make_move("1", player1) }
      expect(game.check_vertical(player1.disc)).to eql true 
    end
  
    it "doesn't win when there isn't 4 in a vertical row" do
      player1.disc = "Y"
      player2.disc = "R"
      game.make_move("1", player1)
      3.times { game.make_move("1", player2) }
      expect(game.check_vertical(player2.disc)). to eql false
    end

    it "triggers #check_win method" do
      player1.disc = "Y"
      4.times { game.make_move("1", player1) }
      expect(game.check_win(player1.disc)).to eql true
    end
  end

  describe "#check_horizontal" do
    it "wins with 4 in a horizontal row" do
      player1.disc = "R"
      ("1".."4").each { |num| game.make_move(num, player1)}
      expect(game.check_horizontal(player1.disc)).to eql true
    end

    it "doesn't win when there isn't 4 in a horizontal row" do
      player1.disc = "R"
      player2.disc = "Y"
      ("1".."3").each { |num| game.make_move(num, player1)}
      game.make_move("4", player2)
      expect(game.check_horizontal(player1.disc)).to eql false
    end

    it "triggers the #check_win method" do
      player1.disc = "R"
      ("1".."4").each { |num| game.make_move(num, player1)}
      expect(game.check_win(player1.disc)).to eql true
    end
  end

  describe "#check_diagonal" do
    it "wins with 4 in a diagonal row" do
      player1.disc = "Y"
      player2.disc = "R"
      game.make_move("1", player1)
      game.make_move("2", player2)
      game.make_move("2", player1)
      2.times { game.make_move("3", player2) }
      game.make_move("3", player1)
      3.times { game.make_move("4", player2) }
      game.make_move("4", player1)
      expect(game.check_diagonal(player1.disc)).to eql true
    end

    it "doesn't win when there isn't 4 in a diagonal row" do
      player1.disc = "Y"
      player2.disc = "R"
      game.make_move("1", player1)
      game.make_move("2", player1)
      game.make_move("2", player2)
      2.times { game.make_move("3", player2) }
      game.make_move("3", player1)
      3.times { game.make_move("4", player2) }
      game.make_move("4", player1)
      expect(game.check_diagonal(player1.disc)).to eql false
    end

    it "wins with a diagonal going right to left" do
      player1.disc = "Y"
      player2.disc = "R"
      3.times { game.make_move("1", player2) }
      2.times { game.make_move("2", player2) }
      game.make_move("3", player2)
      ("1".."4").each { |num| game.make_move(num, player1) }
      expect(game.check_diagonal(player1.disc)).to eql true
    end

    it "triggers the #check_win mathod" do
      player1.disc = "Y"
      player2.disc = "R"
      game.make_move("1", player1)
      game.make_move("2", player2)
      game.make_move("2", player1)
      2.times { game.make_move("3", player2) }
      game.make_move("3", player1)
      3.times { game.make_move("4", player2) }
      game.make_move("4", player1)
      expect(game.check_win(player1.disc)).to eql true
    end

  end

end  