require 'json'
require './classes/book'

module BookData
  def store_book(book)
    book_json = { id: book.id, publish_date: book.publish_date, publisher: book.publisher,
                  cover_state: book.cover_state, label_id: book.label.id }

    if File.size?('./data/book_data/books.json')
      books = JSON.parse(File.read('./data/book_data/books.json'))
      books << book_json
      File.write('./data/book_data/books.json', JSON.pretty_generate(books))
    else
      File.write('./data/book_data/books.json', JSON.pretty_generate([book_json]))
    end
  end

  def store_label(label)
    label_json = { id: label.id, name: label.name, color: label.color, items: label.items.map(&:id) }

    if File.size?('./data/book_data/labels.json')
      labels = JSON.parse(File.read('./data/book_data/labels.json'))
      labels << label_json
      File.write('./data/book_data/labels.json', JSON.pretty_generate(labels))
    else
      File.write('./data/book_data/labels.json', JSON.pretty_generate([label_json]))
    end
  end

  def update_label(label)
    label_json = { id: label.id, name: label.name, color: label.color, items: label.items.map(&:id) }

    return unless File.size?('./data/book_data/labels.json')

    labels = JSON.parse(File.read('./data/book_data/labels.json'))
    labels.each_with_index do |label_item, index|
      if label_item['id'] == label.id
        labels[index] = label_json
        File.write('./data/book_data/labels.json', JSON.pretty_generate(labels))
      end
    end
  end

  def load_books(books_arr, labels_arr)
    if File.size?('./data/book_data/books.json')
      books = JSON.parse(File.read('./data/book_data/books.json'))
      books.each do |book|
        label = labels_arr.find { |label_item| label_item.id == book['label_id'] }
        new_book = Book.new(book['id'], book['publish_date'], book['publisher'], book['cover_state'])
        new_book.add_label(label)
        books_arr << new_book
      end
    end

    books_arr
  end

  def load_labels(labels_arr)
    if File.size?('./data/book_data/labels.json')
      labels = JSON.parse(File.read('./data/book_data/labels.json'))
      labels.each do |label|
        new_label = Label.new(label['id'], label['name'], label['color'])
        labels_arr << new_label
      end
    end

    labels_arr
  end
end
