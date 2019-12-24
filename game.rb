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
    until player1 && player2
      set_name
    end    
    set_color

    

    # puts "Player 1 please enter your name:"
    # ans = gets.chomp.capitalize
    # self.player1 = Player.new(ans)
    # loop do
    #   puts "Thanks #{player1.name}. Please choose your colour. Type Red or Yellow?"
    #   ans = gets.chomp.downcase
    #   if ans == "red" || ans[0] == "r"
    #     self.player1.disc = "R"
    #     break
    #   elsif ans == "yellow" || ans[0] = "y"
    #     self.player1.disc = "Y"
    #     break
    #   else
    #     puts "I don't recognise that colour. Please type 'Red' or 'Yellow'."
    #   end
    # end
    # puts "Player 2 please enter your name."
    # ans = gets.chomp.capitalize
    # self.player2 = Player.new(ans) 
    # self.player2.disc = player1.disc == "R" ? "Y" : "R"  
    # puts "Thanks #{player2.name} you're"
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
  end

  def make_move(column, player)
  end

end