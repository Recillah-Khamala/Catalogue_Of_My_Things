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
      book_data.push({ publisher: book.publisher, publish_date: book.publish_date, cover_state: book.cover_state })
    end

    book_file = './src/json_files/book.json'
    File.write(book_file, JSON.pretty_generate(book_data))
  end

  def load_books
    # handle case when book.json is not available (book.json)
    book_file = './json_files/book.json'
    return unless File.exist?(book_file)

    book_list = JSON.parse(File.read(book_file))
    book_list.each do |book|
      book_new = Book.new(book['publisher'], book['publish_date'], book['cover_state'])
      label_new = Label.new(book['label']['title'], book['label']['color'])
      author_new = Author.new(book['author']['first_name'], book['author']['last_name'])

      book_new.label = label_new
      book_new.author = author_new

      @app.books.push(book_new)
    end
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
    labels_file = './json_files/label.json'
    return unless File.exist?(labels_file)

    label_list = JSON.parse(File.read(labels_file))
    label_list.each do |label|
      label_new = Label.new(label['title'], label['color'])
      @app.labels.push(label_new)
    end
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
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_games
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   book_new = Book.new(book['title'], book['author'])
    #   @app.books.push(book_new)
    # end
  end

  def save_authors
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_authors
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   book_new = Book.new(book['title'], book['author'])
    #   @app.books.push(book_new)
    # end
  end
end
