require_relative '../item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_date
  attr_reader :publish_date, :archived

  def initialize(multiplayer, last_played_date, publish_date)
    super(publish_date, archived)
    @last_played_date = Date.parse(last_played_date)
    @multiplayer = multiplayer
  end

  def can_be_archived?
    duration = Time.now.year - @last_played_date.year
    super && duration > 2
  end
end
