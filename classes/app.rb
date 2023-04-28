require 'json'
require './modules/info'

class App
  attr_reader :books, :music_albums, :games

  include Music
  include Info
  include GameCreated
  include GameData
  include CreateBooks
  include BookData

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @labels = []
    @genre = []
    @authors = []
  end

  def existing_or_new_label
    if @labels.empty?
      add_label
    else
      puts "\nDo you want to use an existing label?"
      list_all_labels
      print "\nYES(y) or NO(n): "
      answer = gets.chomp
      if answer == 'y'
        puts "\nEnter a label number from the list above."
        print 'Label number: '
        label_number = gets.chomp.to_i
        @labels[label_number - 1]
      else
        add_label
      end
    end
  end

  def list_all_books
    puts "\nBook list(#{@books.length}):"
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
    puts "\nLabel list(#{@labels.length}):"
    puts '---------------'
    return puts 'No labels added yet!' if @labels.empty?

    @labels.each.with_index(1) do |label, index|
      puts "#{index}. Name: #{label.name}, Color: #{label.color}"
    end
  end

  def retrieve_book
    load_books(@books, @labels)
  end

  def retrieve_label
    load_labels(@labels)
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
      puts "\nAlbum lists(#{@music_albums.length}):"
      puts '--------------'
      @music_albums.each_with_index do |each, index|
        puts "[#{index}] #{each.name}, #{each.genre} published on #{each.publish_date}"
      end
    end
  end

  def list_all_genres
    if @genre == []
      puts 'your genre is curretly empty, add a new genre!'
      puts
      nil
    else
      puts "\nGenre lists(#{@music_albums.length}):"
      puts '--------------'
      @genre.each_with_index do |each, index|
        puts "[#{index}] #{each.name}\n\n"
      end
    end
  end

  def preserve_music
    data = @music_albums.map do |e|
      { name: e.name,
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

  def list_all_games
    puts 'List of Games: '
    puts 'Are empty. Sorry!!!!' if @games.empty?
    @games.each_with_index do |game, index|
      multiplayer1 = "#{index + 1} Multiplayer: #{game.multiplayer},"
      last_played_at1 = "Last played at: #{game.last_played_at},"
      publish_date1 = "Publish date: #{game.publish_date}"
      puts "#{multiplayer1} #{last_played_at1} #{publish_date1}"
    end
  end

  def list_all_authors
    puts 'Select the author by number:'
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.first_name} #{author.last_name}"
    end
  end

  def retrieve_games
    load_game_data(@games)
  end

  def retrieve_authors
    load_author_data(@authors)
  end
end
