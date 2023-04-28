require 'json'
require './classes/game'

module GameData
  def save_game_data(game)
    game_json = { id: game.id, multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                  publish_date: game.publish_date }

    if File.size?('./data/game_data/game.json')
      game = JSON.parse(File.read('./data/game_data/game.json'))
      game << game_json
      File.write('./data/game_data/game.json', JSON.pretty_generate(game))
    else
      File.write('./data/game_data/game.json', JSON.pretty_generate([game_json]))
    end
  end

  def save_author_data(author)
    author_json = { id: author.id, first_name: author.first_name, last_name: author.last_name }

    if File.size?('./data/game_data/author.json')
      authors = JSON.parse(File.read('./data/game_data/author.json'))
      authors << author_json
      File.write('./data/game_data/author.json', JSON.pretty_generate(authors))
    else
      File.write('./data/game_data/author.json', JSON.pretty_generate([author_json]))
    end
  end

  def load_game_data(games_arr)
    if File.size?('./data/game_data/game.json')
      games = JSON.parse(File.read('./data/game_data/game.json'))
      games.each do |game|
        new_game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'], game['id'])

        games_arr << new_game
      end
    end

    games_arr
  end

  def load_author_data(authors_arr)
    if File.size?('./data/game_data/author.json')
      authors = JSON.parse(File.read('./data/game_data/author.json'))
      authors.each do |author|
        new_author = Author.new(author['first_name'], author['last_name'], author['id'])
        authors_arr << new_author
      end
    end

    authors_arr
  end
end
