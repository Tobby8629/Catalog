require_relative 'app'

class DisplayItems
  def initialize
    @app = App.new
  end

  def choose_option
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Add a book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '10. Exit'
  end

  def do_action(input)
    actions = {
      1 => @app.list_all_books,
      2 => @app.list_all_music_albums,
      3 => @app.list_all_games,
      4 => @app.list_all_genres,
      5 => @app.list_all_labels,
      6 => @app.list_all_authors,
      7 => @app.add_book,
      8 => @app.add_music_album,
      9 => @app.add_game
    }

    actions[input]
  end
end
