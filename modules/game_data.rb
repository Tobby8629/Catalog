require 'json'
require '../classes/game'

module GameData
  def save_game_data
    @game_data = []
    @games.each do |game|
      @game_data.push('multiplayer' => game.multiplayer,
                      'last_played_at' => game.last_played_at,
                      'publish_date' => game.publish_date)
    end
    File.write('../data/game_data/game.json', JSON.pretty_generate(@game_data))
  end

  def load_game_data
    unless File.exist?('../data/game_data/game.json')
      File.write('../data/game_data/game.json',
                 JSON.pretty_generate([]))
    end
    @game_data = JSON.parse(File.read('../data/game_data/game.json'))
    @game_data.each do |game|
      @games.push(Game.new(game['multiplayer'], game['last_played_at'], game['publish_date']))
    end
  end
end