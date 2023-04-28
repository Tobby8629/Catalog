require './classes/genre'
require './classes/music'

module Music
  def create_genre(gen, genre)
    new_genre = Genre.new(genre)
    gen << new_genre
  end

  def music_info
    puts 'Enter the following album details'
    puts 'Title of album'
    name = gets.chomp.capitalize
    puts 'Genre of album'
    genre = gets.chomp.capitalize
    puts 'Date of album release (day-month-year)'
    publish_date = gets.chomp
    puts 'Is it on Spotify? (T/F)'
    answer = gets.chomp.upcase
    if answer == 'T'
      answer = true
    elsif answer == 'F'
      answer = false
    else
      puts 'Invalid answer!!'
      return
    end
    [name, genre, answer, publish_date]
  end

  def create_music(musik, genr)
    value = music_info
    return if value.nil?

    name = value[0]
    genre = value[1]
    answer = value[2]
    publish_date = value[3]
    music = MusicAlbum.new(name, genre, answer, publish_date)
    musik.push(music)
    exist = @genre.find { |e| e.name == genre }
    return if exist

    create_genre(genr, genre)
  end
end
