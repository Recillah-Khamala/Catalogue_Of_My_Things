require_relative './mem1/book'
require_relative './mem1/label'
require_relative './mem2/music_album'
require_relative './mem2/genre'
require_relative './mem3/game'
require_relative './mem3/author'
require_relative './app'
require 'json'

class Storage
  def initialize(app)
    @app = app
  end

  def read_data
    load_books
    load_labels
    load_music_albums
    load_genres
    load_games
    load_authors
  end

  def write_data
    save_books
    save_labels
    save_music_albums
    save_genres
    save_games
    save_authors
  end

  def save_books
    # return if @app.people.empty?

    # people_json = @app.people.map(&:as_json)
    # File.write('people.json', JSON.dump(people_json))
  end

  def load_books
    # handle case when people.json is not available (people.json)
    # return unless File.exist?('people.json')

    # people_json = JSON.parse(File.read('people.json'))
    # people_json.each do |person|
    #   if person['type'] == 'Student'
    #     new_student = Student.new(person['age'], person['classroom'], person['name'], person['parent_permission'])
    #     @app.people.push(new_student)
    #   else
    #     new_teacher = Teacher.new(person['age'], person['specialization'], person['name'])
    #     @app.people.push(new_teacher)
    #   end
    # end
  end

  def save_labels
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_labels
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
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
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
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
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
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
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
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
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
    # end
  end
end
