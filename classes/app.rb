require_relative 'book'
require_relative 'label'

class App
  attr_reader :books, :music_albums, :games

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @labels = []
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
end
