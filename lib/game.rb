class Game
  attr_reader :player, :stick_figure, :dictionary, :secret

  def initialize(args)
    @player = args.fetch("player")
    @stick_figure = args.fetch("stick_figure")
    @dictionary = args.fetch("dictionary")
    @secret = args.fetch("secret", create_secret)
  end

  public

  def play
    puts welcome
    create_secret
    game_loop
    puts result
  end

  private

  def game_loop
    loop do
      solicit_guess
      stick_figure.set_body_parts(bad_guesses)
      stick_figure.display
      puts "\s\s\s\s" + unmasked_secret
      break if game_over?
    end
  end
  
  def create_secret
    dictionary.random_word
  end

  def welcome
    "\n\s\s\s\sHangman is a simple word guessing game. 
    Try to figure out the unknown word by guessing letters. 
    If too many letters which do not appear in the word are guessed, you will be hanged!"
  end

  def bad_guesses
    player.all_guesses.count{ |guess| !secret.include?(guess) }
  end

  def unmasked_secret
    secret.gsub(/[^#{player.all_guesses.join}]/,"_")
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
    bad_guesses == 7
  end

  def result
    return "\s\s\s\sYou won the game!" if winner?
    return "\s\s\s\sYou've been hanged! The secret word was #{secret}" if loser?
  end

  def solicit_guess
    input = get_user_input
    player.make_guess(input)
  end

  def get_user_input
    loop do
      puts "\n\s\s\s\sPlease enter a new letter."
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

