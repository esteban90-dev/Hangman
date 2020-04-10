class Game
  attr_reader :player, :dictionary, :secret, :judged_guess

  def initialize(args)
    @player = args.fetch("player")
    @stick_figure = args.fetch("stick_figure")
    @dictionary = args.fetch("dictionary")
    @secret = args.fetch("secret", create_secret)
    @judged_guess = ""
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

  def judge_guess
    #increase incorrect_guesses unless good_guess?
    #unmask_secret if good_guess?
  end

  def good_guess?
    secret.include?(player.current_guess)
  end

  def solicit_guess
    input = get_user_input
    player.make_guess(input)
  end

  def get_user_input
    loop do
      puts "Please enter a new letter."
      input = gets.chomp
      return input if good_input?(input)
    end
  end

  def good_input?(input)
    return false if input.length != 1
    return false if already_guessed?(input)
    true
  end

  def already_guessed?(input)
    player.all_guesses.include?(input)
  end

end

