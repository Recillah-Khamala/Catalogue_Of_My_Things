require_relative './storage'
class Handler
  include JsonStorage
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
    music_data=get_data('./src/json_files/music_albums.json')
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
    update_data(array, './src/json_files/music_albums.json')
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
