require './classes/game'
require './classes/author'
require_relative 'game_data'
module GameCreated
  include GameData

  def add_game
    print 'Is It multiplayer(y/n):'
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'

    print 'Enter the last played at (yyyy-mm-dd):'
    last_played_at = gets.chomp

    print 'Enter the publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    new_author = add_author
    new_game.add_author(new_author)
    @games << new_game
    @authors << new_author
    save_game_data(new_game)
    save_author_data(new_author)
    puts 'Game has been created successfully!'
  end

  def add_author
    puts ''
    puts 'Assign an Author to the your Game'
    puts '--------------------------'
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp

    Author.new(first_name, last_name)
  end
end
