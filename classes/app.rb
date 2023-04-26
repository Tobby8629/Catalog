require_relative 'book'
require_relative 'label'
require './modules/create_music'
require './modules/music_data'
require './modules/create_game'
require './modules/game_data'

class App
  attr_reader :books, :music_albums, :games

  include Music
  include Info
  include GameCreated
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @labels = []
    @genre = []
  end

  def add_book
    puts ''
    puts 'Enter the following book details'
    puts '--------------------------------'
    print 'Publisher: '
    publisher = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp

    new_book = Book.new(nil, publish_date, publisher, cover_state)
    new_label = add_label
    new_book.add_label(new_label)
    @books << new_book
    puts ''
    puts 'Book added successfully!'
  end

  def add_label
    puts ''
    puts 'Assign a label to the book'
    puts '--------------------------'
    print 'Name: '
    name = gets.chomp
    print 'Color: '
    color = gets.chomp

    new_label = Label.new(nil, name, color)
    @labels << new_label
    new_label
  end

  def list_all_books
    puts ''
    puts "Book list(#{@books.length}):"
    puts '--------------'
    return puts 'No books added yet!' if @books.empty?

    @books.each.with_index(1) do |book, index|
      publisher = "Publisher: #{book.publisher}, " unless book.publisher.nil?
      publish_date = "Publish date: #{book.publish_date}, " unless book.publish_date.nil?
      cover_state = "Cover state: #{book.cover_state}" unless book.cover_state.nil?
      puts "#{index}. #{publisher}#{publish_date}#{cover_state}"
    end
  end

  def list_all_labels
    puts ''
    puts "Label list(#{@labels.length}):"
    puts '---------------'
    return puts 'No labels added yet!' if @labels.empty?

    @labels.each.with_index(1) do |label, index|
      puts "#{index}. Name: #{label.name}, Color: #{label.color}, Amount of items: #{label.items.count}"
    end
  end

  def add_music_album
    create_music(@music_albums, @genre)
    preserve_music
    preserve_genre
  end

  def list_all_music_albums
    if @music_albums == []
      puts 'your music album is empty! Add some cool album'
      puts
      nil
    else
      puts ''
      puts "Album lists(#{@music_albums.length}):"
      puts '--------------'
      @music_albums.each_with_index do |each, index|
        puts "[#{index}] #{each.name}, #{each.genre}, #{each.artist} published on #{each.publish_date}"
        puts ''
      end
    end
  end

  def list_all_genres
    if @genre == []
      puts 'your genre is curretly empty, add a new genre!'
      puts
      nil
    else
      puts ''
      puts "Genre lists(#{@music_albums.length}):"
      puts '--------------'
      @genre.each_with_index do |each, index|
        puts "[#{index}] #{each.name}"
        puts ''
      end
    end
  end

  def preserve_music
    data = @music_albums.map do |e|
      { name: e.name,
        artist: e.artist,
        id: e.id,
        genre: e.genre,
        on_spotify: e.on_spotify,
        publish_date: e.publish_date }
    end
    music_data(data, 'music.json')
  end

  def preserve_genre
    data = @genre.map do |e|
      { name: e.name, id: e.id }
    end
    music_data(data, 'genre.json')
  end

  def retrieve_music
    retrieve_data('music.json', 'album', @music_albums)
  end

  def retrieve_genre
    retrieve_data('genre.json', 'genre', @genre)
  end
  def retrieve_game
    # retrieve_data('game.json', 'game', @games)
  end
# def Add_game
#   create_game(@games)
# end
# def add_game
#   print 'Is It multiplayer(y/n):'
#   multiplayer = gets.chomp.downcase
#   multiplayer = multiplayer == 'y'

#   print 'Enter the last played at (yyyy-mm-dd):'
#   last_played_at = gets.chomp

#   print 'Enter the publish date (yyyy-mm-dd):'
#   publish_date = gets.chomp
#   game = Game.new(multiplayer, last_played_at, publish_date)
#   author = author_game
#   author.add_item(game)
#   @games << game
#   puts 'Game has been created successfully!'
# end
  def list_all_games
    puts 'List of Games: '
    puts 'Are empty. Sorry!!!!' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index + 1} Multiplayer: #{game.multiplayer},
      Last played at: #{game.last_played_at},
      Publish date: #{game.publish_date}"
    end
  end
  
  def list_authors
    puts 'Select the author by number:'
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.first_name} #{author.last_name}"
    end
  end

end
