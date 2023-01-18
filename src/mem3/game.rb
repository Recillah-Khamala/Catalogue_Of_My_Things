# Create a Game class in a separate .rb file.
# All Game class properties visible in the diagram should be defined and set up in the constructor method.
# Implement methods:
# can_be_archived?() in the Game class
# should override the method from the parent class
# should return true if parent's method returns true AND if last_played_at is older than 2 years
# otherwise, it should return false
# Add unit tests for all implemented methods.
# The following options should be available:
# List of games
# Add a game
# All data should be preserved by saving collections in .json files.
# Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
# games table (add all properties and associations from the parent Item class as table columns)

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
