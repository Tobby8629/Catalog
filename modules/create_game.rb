require_relative '../classes/game'

module GameCreated

def add_game
  print 'Is It multiplayer(y/n):'
  multiplayer = gets.chomp.downcase
  multiplayer = multiplayer == 'y'

  print 'Enter the last played at (yyyy-mm-dd):'
  last_played_at = gets.chomp

  print 'Enter the publish date (yyyy-mm-dd):'
  publish_date = gets.chomp
  new_game = Game.new(multiplayer, last_played_at, publish_date)
  author = author
  new_game.author
  @games << new_game
  puts 'Game has been created successfully!'
end
end