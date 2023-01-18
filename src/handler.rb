class Handler

  # option to list all books 
  def books
    if @books.empty?
      puts 'No books listed!!!'
    else
      Number_of_books = books.count
      puts Number_of_books > 1 ? "#{Number_of_books} Books Available" : "#{Number_of_books} Book Available "
      puts '*' * 70
      @books.each_with_index do |book, i|
        puts "#{i + 1} - Title: #{book.label.title} | Author: #{book.author.first_name} #{book.author.last_name} | ",
             " Publisher: #{book.publisher} | Date: #{book.date} | Cover State: #{book.cover_state}"
      end
    end
  end

  # option to list all labels (e.g. 'Gift', 'New')
  def labels
    if @labels.empty?
      puts 'No labes listed!!!'
    else
      Number_of_labels = labels.count
      puts Number_of_labels > 1 ? "#{Number_of_labels} Labels Available" : "#{Number_of_labels} Label Available "
      puts '-' * 70
      @labels.each_with_index do |label, i|
        puts "#{i + 1} | Title : #{label.title} | Color: #{label.color}"
      end
    end
  end

  def new_author
    first_name = get_user_input('Enter Author\'s first name: ')
    last_name = get_user_input('Enter Author\'s last name: ')
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

    publisher = get_user_input('Publisher?: ')
    date = get_user_input('Year of publication?: ')
    cover_state = get_user_input('Book Cover State? [good/bad]: ').downcase

    book = Book.new(publisher, date, cover_state)
    label.add_item(book)
    author.add_item(book)

    @books.push(book)
    @labels.push(label)
    @authors.push(author)

    puts ''
    puts "#{label.title} by #{author.first_name} #{author.last_name} book created successfully"
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
      puts "First Name: #{author.first_name}"
      puts "Last Name: #{author.last_name}"
    end
  end

  def add_music_album
    puts 'Album name: '
    name = gets.chomp

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
  end

  def albums
    puts 'Music Albums'
    @music_albums.each do |music_album|
      puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
  end

  def genres
    puts 'Genres:'
    puts 'No genre found' if @genres.empty?
    @genres.each do |genre|
      puts "Genre name: #{genre.name}"
    end
  end
end
