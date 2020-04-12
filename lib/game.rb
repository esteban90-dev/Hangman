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

  def save(fname)
    #create save file in YAML format
    save_file = File.open(fname, "w")
    save_file.puts YAML.dump({
      "player" => player,
      "stick_figure" => stick_figure,
      "dictionary" => dictionary,
      "secret" => secret
    })
    save_file.close
  end

  def self.load(fname)
    file = File.open(fname)
    load = YAML.load(file)
    self.new(load)
  end

  private

  def game_loop
    loop do
      solicit_guess
      stick_figure.set_body_parts(bad_guesses)
      stick_figure.display
      puts guess_history
      puts tab + unmasked_secret
      break if game_over?
    end
  end
  
  def create_secret
    dictionary.random_word
  end

  def welcome
    tab + "Hangman is a simple word guessing game. 
    Try to figure out the unknown word by guessing letters. 
    If too many letters which do not appear in the word are guessed, you will be hanged!"
  end

  def tab
    "\n\s\s\s\s"
  end

  def guess_history
    tab + "already guessed letters: #{player.all_guesses.join(',')} \n "
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
    return tab + "You won the game!" if winner?
    return tab + "You've been hanged! The secret word was #{secret}" if loser?
  end

  def solicit_guess
    input = get_user_input
    player.make_guess(input)
  end

  def get_user_input
    loop do
      puts tab + "Please enter a new letter."
      input = gets.chomp.downcase
      return input if good_input?(input)
    end
  end

  def good_input?(input)
    return false unless input.match?(/^[a-z]{1}$/)
    return false if already_guessed?(input)
    true
  end

  def already_guessed?(input)
    player.all_guesses.include?(input)
  end

end

