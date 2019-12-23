require './player'

class Game
  attr_accessor :player1, :player2

  def initialize
    player1 = nil
    player2 = nil
  end

  def start
    setup_players
    main_game
  end

  def setup_players
    puts "Player 1 please enter your name:"
    ans = gets.chomp.capitalize
    self.player1 = Player.new(ans)
    loop do
      puts "Thanks #{player1.name}. Please choose your colour. Type Red or Yellow?"
      ans = gets.chomp.downcase
      if ans == "red" || ans[0] == "r"
        self.player1.disc = "R"
        break
      elsif ans == "yellow" || ans[0] = "y"
        self.player1.disc = "Y"
        break
      else
        puts "I don't recognise that colour. Please type 'Red' or 'Yellow'."
      end
    end
    puts "Player 2 please enter your name."
    ans = gets.chomp.capitalize
    self.player2 = Player.new(ans) 
    self.player2.disc = player1.disc == "R" ? "Y" : "R"  
    puts "Thanks #{player2.name} you're"
  end

  def check_color(answer)
    
  end

  def main_game
  end

  def make_move(column, player)
  end

end