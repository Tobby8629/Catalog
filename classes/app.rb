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
end
