require_relative './mem1/book'
require_relative './mem1/label'
require_relative './mem2/music_album'
require_relative './mem2/genre'
require_relative './mem3/game'
require_relative './mem3/author'
require_relative './store'
require_relative './handler'

class App < Handler
  def initialize
    super
    @books = load_books
    @labels = load_labels
    @games = load_games
    @authors = load_authors
    @genres = []
    @music_albums = []

    # @storage = Storage.new(self)
  end

  def spacer
    char = '*'
    puts char * 50
  end

  def welcome
    spacer
    puts 'Welcome to the Catalogue of things App'
    spacer
  end

  def start
    welcome
    puts "Choose from below:\n
        1 - List all books\n
        2 - List all music albums\n
        3 - List of games\n
        4 - List all genres (e.g 'Comedy', 'Thriller')\n
        5 - List all labels (e.g. 'Gift', 'New')\n
        6 - List all authors (e.g. 'Stephen King')\n
        7 - Add a book\n
        8 - Add a music album\n
        9 - Add a game\n
        10- Exit\n"

    print 'choice: '
    choice = gets.chomp.to_i

    close_app if choice == 10

    choises(choice)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def choises(choice)
    case choice
    when 1
      books
    when 2
      albums
    when 3
      games
    when 4
      genres
    when 5
      labels
    when 6
      authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    else
      puts 'oops! I dont have that choise. Try again'
      spacer
    end

    option
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def close_app
    # @storage.write_data
    spacer
    puts 'Till next time bye!!!'
    spacer
    exit
  end

  def option
    spacer
    puts 'continue?:
    1 - Yes I want make a different choise
    2 - No I want exit the app'

    print 'Option: '
    option = gets.chomp.to_i

    if option == 1
      start
    else
      close_app
    end
  end
end
