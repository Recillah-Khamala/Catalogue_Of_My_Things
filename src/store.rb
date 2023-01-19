require_relative './mem1/book'
require_relative './mem1/label'
require_relative './mem2/music_album'
require_relative './mem2/genre'
require_relative './mem3/game'
require_relative './mem3/author'
require_relative './app'
require 'json'

module Storage
  # def initialize(app)
  #   @app = app
  # end

  # def read_data
  #   load_books
  #   load_labels
  #   load_music_albums
  #   load_genres
  #   load_games
  #   load_authors
  # end

  # def write_data
  #   save_books
  #   save_labels
  #   save_music_albums
  #   save_genres
  #   save_games
  #   save_authors
  # end

  def save_books
    book_data = []
    @books.each do |book|
      book_data.push({ name: book.name, publisher: book.publisher, publish_date: book.publish_date,
                       cover_state: book.cover_state })
    end

    book_file = './src/json_files/book.json'
    File.write(book_file, JSON.pretty_generate(book_data))
  end

  def load_books
    # handle case when book.json is not available (book.json)
    book_file = './src/json_files/book.json'
    data = []
    if File.exist?(book_file) && File.read(book_file) != ''
      JSON.parse(File.read(book_file)).each do |book|
        data.push(Book.new(book['name'], book['publisher'], book['publish_date'], book['cover_state']))
        # label_new = Label.new(book['label']['title'], book['label']['color'])
        # author_new = Author.new(book['author']['first_name'], book['author']['last_name'])
        # data.label = label_new
        # data.author = author_new
      end
      # return unless File.exist?(book_file)

      # book_list = JSON.parse(File.read(book_file))
      # book_list.each do |book|
      #   book_new = Book.new(book['publisher'], book['publish_date'], book['cover_state'])
      #   label_new = Label.new(book['label']['title'], book['label']['color'])
      #   author_new = Author.new(book['author']['first_name'], book['author']['last_name'])

      #   book_new.label = label_new
      #   book_new.author = author_new

      # @app.books.push(book_new)
    end
    data
  end

  def save_labels
    label_data = []
    @labels.each do |label|
      label_data.push({ title: label.title, color: label.color })
    end

    label_file = './src/json_files/label.json'
    File.write(label_file, JSON.pretty_generate(label_data))
  end

  def load_labels
    file = './src/json_files/label.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Label.new(element['title'], element['color']))
      end
    end
    data
    # labels_file = './json_files/label.json'
    # return unless File.exist?(labels_file)

    # label_list = JSON.parse(File.read(labels_file))
    # label_list.each do |label|
    #   label_new = Label.new(label['title'], label['color'])
    #   @app.labels.push(label_new)
    # end
  end

  def save_music_albums
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_music_albums
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   book_new = Book.new(book['title'], book['author'])
    #   @app.books.push(book_new)
    # end
  end

  def save_genres
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_genres
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   book_new = Book.new(book['title'], book['author'])
    #   @app.books.push(book_new)
    # end
  end

  def save_games
    data = []
    @games.each do |game|
      data.push({ multiplayer: game.multiplayer, publish_date: game.publish_date,
                  last_played_date: game.last_played_date })
    end
    File.write('./src/json_files/games.json', JSON.pretty_generate(data))
  end

  def load_games
    data = []
    file = './src/json_files/games.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |games|
        data.push(Game.new(games['multiplayer'], games['last_played_date'], games['publish_date']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def load_authors
    authors_data = []
    file = './src/json_files/authors.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |author|
        authors_data.push(Author.new(author['first_name'], author['last_name']))
      end
    else
      File.write(file, [])
    end

    authors_data
  end

  def save_authors
    authors_data = []
    @authors.each do |author|
      authors_data.push({ first_name: author.first_name, last_name: author.last_name })
    end
    open('./src/json_files/authors.json', 'w') { |f| f << JSON.pretty_generate(authors_data) }
  end
end
