class Player
  attr_accessor :guess

  def initialize
    @guess = ""
  end
end


player1 = Player.new
puts "enter guess"
player1.guess = gets.chomp
puts "player1 guess is #{player1.guess}"