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
end
