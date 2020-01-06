require './player'
require './board'

class Game
  attr_accessor :player1, :player2, :board

  def initialize
    @player1 = nil
    @player2 = nil
    @board = Board.new
  end

  def start
    setup_players
    main_game
  end

  def setup_players 
    until player1 && player2
      set_name
    end    
    set_color
  end

  def set_name
    loop do
      player = player1 ? "Player 2" : "Player 1"
      puts "#{player} please enter your name:"
      ans = gets.chomp.capitalize
      if ans.empty?
        puts "Name can't be blank."
      elsif ans.size > 15
        puts "Name should be less than 15 characters."
      else
        if player1.nil? 
          self.player1 = Player.new(ans)
        else
          self.player2 = Player.new(ans)
        end
        break
      end      
    end
  end

  def set_color
    loop do
      puts "#{player1.name} please choose your colour. Type 'Red' or 'Yellow'."
      ans = gets.chomp.downcase
      if ans == "red" || ans[0] == "r"
        self.player1.disc = "R"
        self.player2.disc = "Y"
        puts "Thanks. #{player1.name} you're #{player1.disc}.\n#{player2.name} you're #{player2.disc}."
        break
      elsif ans == "yellow" || ans[0] == "y"
        self.player1.disc = "Y"
        self.player2.disc = "R"
        puts "Thanks. #{player1.name} you're #{player1.disc}.\n#{player2.name} you're #{player2.disc}."
        break
      else
        puts "I don't recognise that colour. Please type 'Red' or 'Yellow'."
      end
    end
  end

  def main_game
    players = [player1, player2].cycle
    loop do
      board.display_board     
      player = players.next
      ans = column_selection(player)
      make_move(ans, player)
    end
  end

  def moves
    { "1" => board.col1, "2" => board.col2, "3" => board.col3, "4" => board.col4,
     "5" => board.col5, "6" => board.col6, "7" => board.col7 }
  end

  def column_selection(player)
    loop do
      puts "#{player.name} choose a column."
      ans = gets.chomp
      if ("1".."7") === ans
        return ans
      else
        puts "I don't recognise that command. Please enter 1 - 7."
      end
    end
  end

  def make_move(column, player)
    board.add_to_board(moves[column], player.disc)
  end

  def check_win(disc)
    check_vertical(disc)
  end

  def check_horizontal(disc)
    # board.return_board.transpose.each_cons(4).any? do |col| 
      
    # end
  end

  def check_vertical(disc)
    board.return_board.any? do |col|
      col.each_cons(4).any? do |row|
        row.all? { |tile| tile == disc }
      end
    end
  end

  def check_diagonal(disc)
   
  end

end