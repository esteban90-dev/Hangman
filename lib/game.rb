class Game
  attr_reader :player, :dictionary, :secret
  attr_accessor :unmasked_secret, :incorrect_guesses

  def initialize(args)
    @player = args.fetch("player")
    @stick_figure = args.fetch("stick_figure")
    @dictionary = args.fetch("dictionary")
    @secret = args.fetch("secret", create_secret)
    @unmasked_secret = ""
    @incorrect_guesses = 0
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
    self.incorrect_guesses += 1 unless good_guess?
  end

  def unmask_secret
    self.unmasked_secret = secret.gsub(/[^#{player.current_guess}]/,"_")
  end

  def game_over?
    return true if winner?
    return true if loser?
    false
  end

  def winner?
    unmasked_secret == secret
  end

  def loser?
    incorrect_guesses == 7
  end

  def good_guess?
    secret.include?(player.current_guess)
  end

  def result
    return "You won the game!" if winner?
    return "You've been hanged!" if loser?
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

