class Player
  attr_reader :guess

  def initialize
    @guess = []
  end

  public

  def make_guess(input)
    self.guess.push(input)
  end
end
