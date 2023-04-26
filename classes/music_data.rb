require 'json'
require_relative './genre'
require_relative './music'

def music_data(data, location)
  json_data = JSON.generate(data)
  File.write("./data/music_data/#{location}", json_data)
end

def retrieve_data(location, res, arr)
  File.open("./data/music_data/#{location}", 'r') do |file|
    data = file.read
    if data != ''
      parsed_data = JSON.parse(data)
      if res == 'album'
        parsed_data.map do |data|
          fresh = MusicAlbum.new(data['name'], data['genre'], data['artist'], data['on_spotify'], data['publish_date'],
                                 data['id'])
          arr << fresh
        end
      elsif res == 'genre'
        parsed_data.map do |data|
          fresh = Genre.new(data['name'], data['id'])
          arr << fresh
        end
      end
    end
  end
end
