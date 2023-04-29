require './classes/book'
require './classes/label'

module CreateBooks
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
      update_label(label)
    else
      @labels << label
      store_label(label)
    end
    store_book(new_book)
    puts "\nBook added successfully!"
  end

  def add_label
    puts "\nAssign a label to the book"
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
end
