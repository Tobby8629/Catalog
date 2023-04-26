require 'json'
require_relative 'book'
require_relative 'label'

class Data
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def store_book(book)
    book_json = { id: book.id, publish_date: book.publish_date, publisher: book.publisher,
     cover_state: book.cover_state, label_id: book.label.id }

     if File.size?('./data/books.json')
      books = JSON.parse(File.read('./data/books.json'))
      books << book_json
      File.write('./data/books.json', JSON.pretty_generate(books))
    else
      File.write('./data/books.json', JSON.pretty_generate([book_json]))
    end  
  end

  def store_label(label)
    label_json = { id: label.id, name: label.name, color: label.color }

    if File.size?('./data/labels.json')
      labels = JSON.parse(File.read('./data/labels.json'))
      labels << label_json
      File.write('./data/labels.json', JSON.pretty_generate(labels))
    else
      File.write('./data/labels.json', JSON.pretty_generate([label_json]))
    end
  end

  def load_books
    if File.size?('./data/books.json')
      books = JSON.parse(File.read('./data/books.json'))
      books.each do |book|
        label = load_labels.find { |label| label.id == book['label_id'] }
        new_book = Book.new(book['id'], book['publish_date'], book['publisher'], book['cover_state'])
        new_book.add_label(label)
        @books << new_book
      end
    end

    @books
  end

  def load_labels
    if File.size?('./data/labels.json')
      labels = JSON.parse(File.read('./data/labels.json'))
      labels.each do |label|
        new_label = Label.new(label['id'], label['name'], label['color'])
        new_label.items = load_books.select { |book| book.label.id == new_label.id }
        @labels << new_label
      end
    end

    @labels
  end
end