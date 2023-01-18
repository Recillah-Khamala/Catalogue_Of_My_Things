class Handler
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
