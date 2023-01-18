require_relative '../item'

# Create a Book class in a separate .rb file.
class Book < Item
  # All Book class properties visible in the diagram should be defined and set up in the constructor method.
  attr_accessor :publisher, :cover_state, :label, :author, :publish_date

  def initialize(publisher, publish_date, cover_state)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end

  # Implement methods:
  #   can_be_archived?() in the Book class
  #   should override the method from the parent class
  #   should return true if parent's method returns true OR if cover_state equals to "bad"
  #   otherwise, it should return false

  def can_be_archived?
    super || cover_state == 'bad'
  end

  # All data should be preserved by saving collections in .json files.
end

# The following options should be available:
#   List all books
#   Add a book
# Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
#   books table (add all properties and associations from the parent Item class as table columns)
