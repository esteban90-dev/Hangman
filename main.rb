$LOAD_PATH << "."
$LOAD_PATH << "./lib/"

require "game.rb"
require "player.rb"
require "stick_figure.rb"
require "dictionary.rb"
require "user_input.rb"
require 'yaml'

puts Game.welcome
input = UserInput::get_user_input("Would you like to load a previous game? Enter y/n.", /^[yn]{1}$/)

if input == 'y'
  game1 = Game.load("./saves/save_file.txt")
  game1.resume
else 
  player1 = Player.new
  stick1 = StickFigure.new
  dictionary1 = Dictionary.new("./for_reference/dictionary.txt")

  game1 = Game.new({
    "player" => player1,
    "stick_figure" => stick1,
    "dictionary" => dictionary1
  })

  game1.play
end























