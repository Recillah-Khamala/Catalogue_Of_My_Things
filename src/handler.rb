class Handler
  def add_game
    print 'Please write multiplayer: '
    multiplayer = gets.chomp

    print 'Please write date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    print 'Please write last played date [Enter date in format (yyyy-mm-dd)]'
    last_played_date = gets.chomp

    @games.push(Game.new(multiplayer, publish_date, last_played_date))
    puts 'Game is created'
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
end
