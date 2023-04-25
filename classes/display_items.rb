require_relative 'app'

class Display_items
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
    case input
    when 1 then @app.display_books
    when 2 then @app.display_music_albums
    when 3 then @app.display_games
    when 4 then @app.display_genres
    when 5 then @app.display_labels
    when 6 then @app.display_authors
    when 7 then @app.add_book
    when 8 then @app.add_music_album
    when 9 then @app.add_game
    when 10 
    end
  end
end
