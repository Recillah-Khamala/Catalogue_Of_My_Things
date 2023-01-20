require_relative './mem1/book'
require_relative './mem1/label'
require_relative './mem2/music_album'
require_relative './mem2/genre'
require_relative './mem3/game'
require_relative './mem3/author'
require_relative './app'
require 'json'

module Storage
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
      end
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
  end

  def save_music_albums
    album_data = []
    @music_albums.each do |music_album|
      album_data.push({ name: music_album.name, publish_date: music_album.publish_date,
                        on_spotify: music_album.on_spotify })
    end

    album_file = './src/json_files/music_albums.json'
    File.write(album_file, JSON.pretty_generate(album_data))
  end

  def load_music_album
    # handle case when book.json is not available (book.json)
    album_file = './src/json_files/music_albums.json'
    data = []
    if File.exist?(album_file) && File.read(album_file) != ''
      JSON.parse(File.read(album_file)).each do |music_album|
        data.push(MusicAlbum.new(music_album['name'], music_album['publish_date'], music_album['on_spotify']))
      end
    end
    data
  end

  def save_genres
    genre_data = []
    @genres.each do |genre|
      genre_data.push({ name: genre.name })
    end

    genre_file = './src/json_files/genre.json'
    File.write(genre_file, JSON.pretty_generate(genre_data))
  end

  def load_genres
    genre_file = './src/json_files/genre.json'
    data = []
    if File.exist?(genre_file) && File.read(genre_file) != ''
      JSON.parse(File.read(genre_file)).each do |genre|
        data.push(Genre.new(genre['name']))
      end
    end
    data
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
