require_relative 'book'
require_relative 'label'
require_relative 'preserve_data'
require './modules/create_music'
require './modules/music_data'

class App
  attr_reader :books, :music_albums, :games

  include Music
  include Info
  def initialize
    @data = PreserveData.new
    @books = []
    @music_albums = []
    @games = []
    @labels = []
    @genre = []
  end

  def add_book
    puts "\nEnter the following book details"
    puts '--------------------------------'
    print 'Publisher: '
    publisher = gets.chomp
    print 'Publish date (DD-MM-YYYY): '
    publish_date = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp

    new_book = Book.new(nil, publish_date, publisher, cover_state)
    label = existing_or_new_label
    new_book.add_label(label)
    @books << new_book
    if @labels.include?(label)
      @data.update_label(label)
    else
      @labels << label
      @data.store_label(label)
    end
    @data.store_book(new_book)
    puts "\nBook added successfully!"
  end

  def add_label
    puts ''
    puts 'Assign a label to the book'
    puts '--------------------------'
    print 'Name: '
    name = gets.chomp
    print 'Color: '
    color = gets.chomp

    Label.new(nil, name, color)
  end

  def existing_or_new_label
    if @labels.empty?
      add_label
    else
      puts ''
      puts 'Do you want to use an existing label?'
      list_all_labels
      puts ''
      print 'YES(y) or NO(n): '
      answer = gets.chomp
      if answer == 'y'
        puts ''
        puts 'Enter a label number from the list above:'
        print 'Label number: '
        label_number = gets.chomp.to_i
        @labels[label_number - 1]
      else
        add_label
      end
    end
  end

  def list_all_books
    @books = @data.load_books
    puts ''
    puts "Book list(#{@books.length}):"
    puts '--------------'
    return puts 'No books added yet!' if @books.empty?

    @books.each.with_index(1) do |book, index|
      publisher = "Publisher: #{book.publisher}, " unless book.publisher.nil?
      publish_date = "Publish date: #{book.publish_date}, " unless book.publish_date.nil?
      cover_state = "Cover state: #{book.cover_state}" unless book.cover_state.nil?
      label = "Label: #{book.label.name}" unless book.label.nil?
      puts "#{index}. #{publisher}#{publish_date}#{cover_state} #{label}"
    end
  end

  def list_all_labels
    @labels = @data.load_labels
    puts ''
    puts "Label list(#{@labels.length}):"
    puts '---------------'
    return puts 'No labels added yet!' if @labels.empty?

    @labels.each.with_index(1) do |label, index|
      puts "#{index}. Name: #{label.name}, Color: #{label.color}"
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
end
