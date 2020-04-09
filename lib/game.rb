class Game
  attr_reader :player, :dictionary, :secret

  def initialize(args)
    @player = args["player"]
    @stick_figure = args["stick_figure"]
    @dictionary = args["dictionary"]
    @secret = create_secret
  end

  public
  
  def create_secret
    dictionary.random_word
  end

  def welcome
    "\n\tHangman is a simple word guessing game. 
     Try to figure out the unknown word 
     by guessing letters. If too many letters 
     which do not appear in the word are guessed, 
     you will be hanged!"
  end

  def prompt_player
    loop do
      puts "Please enter a new letter."
      break if good_input?(gets.chomp)
    end
  end

  def good_input?(input)
    return false if input.length != 1
    return false if already_guessed?(input)
    true
  end

  def already_guessed?(input)
    player.guess.include?(input)
  end

end

