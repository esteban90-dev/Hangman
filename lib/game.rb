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

end

