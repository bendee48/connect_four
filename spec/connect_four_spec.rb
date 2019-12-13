require './board.rb'

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