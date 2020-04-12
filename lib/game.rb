class Game
  TAB = "\n\s\s\s\s"

  attr_reader :player, :stick_figure, :dictionary, :secret

  def initialize(args)
    @player = args.fetch("player")
    @stick_figure = args.fetch("stick_figure")
    @dictionary = args.fetch("dictionary")
    @secret = args.fetch("secret", create_secret)
  end

  public

  def self.load(fname)
    file = File.open(fname)
    load = YAML.load(file)
    self.new(load)
  end

  def self.welcome
    TAB + "Hangman is a simple word guessing game. 
    Try to figure out the unknown word by guessing letters. 
    If too many letters which do not appear in the word are guessed, you will be hanged!"
  end

  def play
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
    puts TAB + "Game saved."
  end

  private

  def game_loop
    loop do
      prompt_save if not_first_round?
      solicit_guess
      stick_figure.set_body_parts(bad_guesses)
      stick_figure.display
      puts guess_history
      puts TAB + unmasked_secret
      break if game_over?
    end
  end
  
  def create_secret
    dictionary.random_word
  end

  def guess_history
    TAB + "already guessed letters: #{player.all_guesses.join(',')} \n "
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
    return TAB + "You won the game!" if winner?
    return TAB + "You've been hanged! The secret word was #{secret}" if loser?
  end

  def solicit_guess
    input = ""
    loop do
      input = get_user_input("Please enter a new letter.", /^[a-z]{1}$/)
      break unless already_guessed?(input)
    end
    player.make_guess(input)
  end

  def prompt_save
    input = get_user_input("Would you like to save the game? type y/n.", /^[yn]{1}$/)
    save("./saves/save_file.txt") if input == "y"
  end

  def get_user_input(prompt_message, regexp) #uses regular expression to verify user input
    loop do
      puts TAB + prompt_message
      input = gets.chomp.downcase
      if input.match?(regexp)
        return input
      else
        puts TAB + "Invalid input."
      end
    end
  end

  def already_guessed?(input)
    player.all_guesses.include?(input)
  end

  def not_first_round?
    player.all_guesses.length > 0
  end

end

