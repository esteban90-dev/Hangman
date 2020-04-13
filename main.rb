$LOAD_PATH << File.expand_path("./lib", File.dirname(__FILE__))

require "game"
require "player"
require "stick_figure"
require "dictionary"
require "user_input"
require 'yaml'

puts Game.welcome
input = UserInput::get_user_input("Would you like to load a previous game? Enter y/n.", /^[yn]{1}$/)

if input == 'y'
  game1 = Game.load("./saves/save_file.txt")
  game1.resume
else 
  player1 = Player.new
  stick1 = StickFigure.new
  secret1 = Dictionary.new("./for_reference/dictionary.txt").random_word

  game1 = Game.new({
    "player" => player1,
    "stick_figure" => stick1,
    "secret" => secret1
  })

  game1.play
end























