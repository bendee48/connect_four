require './player'

class Game
  attr_accessor :player1, :player2

  def initialize
    player1 = nil
    player2 = nil
  end

  def start
    setup_player
    main_game
  end

  def setup_player
    puts "Player 1 please enter your name:"
    ans = gets.chomp
    self.player1 = Player.new(ans)
    puts "Player 2 please enter your name."
    ans = gets.chomp
    self.player2 = Player.new(ans)
    puts "#{player1.name} please choose your colour. Red or Yellow?"
    ans = gets.chomp
    player1.disc = ans == "Red" ? "R" : "Y"
  end

  def main_game
  end

  def make_move(column, player)
  end

end