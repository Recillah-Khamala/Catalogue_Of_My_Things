require_relative './store'
require_relative './storage'

class Handler
  include JsonStorage
  include Storage

  # option to list all books
  def books
    if @books.empty?
      puts 'No books listed!!!'
    else
      @books.each_with_index do |book, i|
        puts "#{i + 1} - Name: #{book.name} | Publisher: #{book.publisher} | Date: #{book.publish_date} | Cover State: #{book.cover_state}"
      end
    end
  end

  # option to list all labels (e.g. 'Gift', 'New')
  def labels
    if @labels.empty?
      puts 'No labes listed!!!'
    else
      @labels.each_with_index do |label, i|
        puts "#{i + 1} | Title : #{label.title} | Color: #{label.color}"
      end
    end
  end

  def new_author
    print 'Enter Author\'s first name: '
    first_name = gets.chomp
    print 'Enter Author\'s last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def new_label(type)
    print "Title of the #{type}: "
    title = gets.chomp
    print "Color of the #{type}: "
    color = gets.chomp
    Label.new(title, color)
  end

  # option to add a book
  def add_book
    author = new_author
    label = new_label('Book')

    print 'Book name: '
    title = gets.chomp
    print 'Publisher?: '
    publisher = gets.chomp
    print 'Year of publication?: '
    date = gets.chomp
    print 'Cover state? [good/bad]: '
    cover_state = gets.chomp.downcase

    book = Book.new(title, publisher, date, cover_state)
    label.add_item(book)
    author.add_item(book)

    @books.push(book)
    @labels.push(label)
    @authors.push(author)

    puts ''
    puts "#{label.title} by #{author.first_name} #{author.last_name} book created successfully"
    save_books
    save_labels
    save_authors
  end

  def add_game
    print 'Please write multiplayer: '
    multiplayer = gets.chomp

    print 'Please write date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp

    print 'Please write last played date [Enter date in format (yyyy-mm-dd)]: '
    last_played_date = gets.chomp

    @games.push(Game.new(multiplayer, publish_date, last_played_date))
    puts 'Game is created'
    save_games
  end

  def games
    puts 'Available Games:'
    @games.each do |games|
      puts "Multiplayer: #{games.multiplayer}, Publish Date: #{games.publish_date},
      Last played date: #{games.last_played_date}"
    end
  end

  def authors
    puts 'Authors:'
    @authors.each do |author|
      puts "First Name: #{author.first_name} | Last Name: #{author.last_name}"
    end
  end

  def add_music_album
    puts 'Album name: '
    name = gets.chomp
    puts 'Genre: '
    genre_name = gets.chomp
    @genres.push(Genre.new(genre_name))
    store_genre_data


    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    puts 'Is it available on Spotify? Y/N'
    on_spotify = gets.chomp.downcase
    case on_spotify
    when 'y'
      @music_albums.push(MusicAlbum.new(name, publish_date, true))
    when 'n'
      @music_albums.push(MusicAlbum.new(name, publish_date, false))
    end
    puts 'Music album created'
    store_music_data
  end

  def albums
    music_data = get_data('./src/json_files/music_albums.json')
    puts 'No music found' if music_data.empty?
    music_data.each do |music_album|
      puts "Album_name: #{music_album['music_name']} | On_spotify: #{music_album['music_on_spotify']}"
    end
  end

  def genres
    data = get_data('./src/json_files/genres.json')
    puts 'No genre found' if data.empty?
    data.each do |genre|
      puts "Genre name: #{genre['genre_name']}"
    end
  end

  def store_music_data
    array = []
    @music_albums.each do |music|
      array << {
        music_id: music.id,
        music_name: music.name,
        music_on_spotify: music.on_spotify

      }
    end
    update_data(array, './json_files/music_albums.json')
  end

  def store_genre_data
    array = []
    @genres.each do |genre|
      array << {
        genre_id: genre.id,
        genre_name: genre.name


      }
    end
    update_data(array, './src/json_files/genres.json')
  end
end
