class Game
  attr_reader :dictionary, :secret

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
     you will be hanged!""\n"
  end

end

