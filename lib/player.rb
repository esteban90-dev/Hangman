class Player
  attr_reader :guess

  def initialize
    @guess = []
  end

  public

  def make_guess(input)
    self.guess.push(input)
  end

  def current_guess
    guess[-1]
  end

  def all_guesses
    guess
  end
  
end
