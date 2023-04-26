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
end