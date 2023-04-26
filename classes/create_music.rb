require_relative './genre'
require_relative './Music'

def create_genre(gen, genre)
  new_genre = Genre.new(genre)
  gen << new_genre
end

def music_info
  puts ''
  puts 'Enter the following book details'
  puts '--------------------------------'
  puts 'Title of album'
  name = gets.chomp.capitalize
  puts 'Artist'
  artist = gets.chomp.capitalize
  puts 'genre of album'
  genre = gets.chomp.capitalize
  puts 'Date of album release(day-month-year)'
  publish_date = gets.chomp.capitalize
  puts 'Is it on spotify?()T/F'
  answer = gets.chomp.upcase
  if answer == 'T'
    answer = true
  elsif answer == 'F'
    answer = false
  else
    puts 'invalid answer'
    puts ' '
    return
  end
  [name, artist, genre, answer, publish_date]
end

def create_music(musik, genr)
  value = music_info
  return if value.nil?

  name = value[0]
  artist = value[1]
  genre = value[2]
  answer = value[3]
  publish_date = value[4]
  music = MusicAlbum.new(name, genre, artist, answer, publish_date)
  musik.push(music)
  exist = @genre.find { |e| e.name == genre }
  return if exist

  create_genre(genr, genre)
end
















# genre = []

# jazz = Genre.new("jazz");
# hip_pop = Genre.new("hip-pop");
# latino = Genre.new("latino");
# highlife= Genre.new("highlife");
# rock = Genre.new("rock");
# gospel = Genre.new("gospel");
# grime = Genre.new("grime");
# reggae = Genre.new("reggae")

# genre.push(jazz,hip_pop,latino,highlife,rock,gospel,grime,reggae)

# puts genre
