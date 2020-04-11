require "./lib/game.rb"
require "./lib/player.rb"
require "./lib/stick_figure.rb"
require "./lib/dictionary.rb"
require "open-uri"

player1 = Player.new
stick1 = StickFigure.new
dictionary1 = Dictionary.new

game1 = Game.new({
  "player" => player1,
  "stick_figure" => stick1,
  "dictionary" => dictionary1
})

game1.play





















