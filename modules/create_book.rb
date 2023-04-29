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
      puts "\nEnter an existing label number(1-#{@labels.count}) or 'n' to create a new label"
      list_all_labels
      choose_label
    end
  end

  def choose_label
    print "\nExisting label number or 'n': "
    answer = gets.chomp
    if answer.to_i.to_s == answer && answer.to_i.between?(1, @labels.count)
      @labels[answer.to_i - 1]
    elsif answer == 'n'
      add_label
    else
      puts "\nInvalid input, try again!"
      choose
    end
  end
end
