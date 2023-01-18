# Create a Book class in a separate .rb file.
class Book < Item
  # All Book class properties visible in the diagram should be defined and set up in the constructor method.
  attr_accessor :publisher, :cover_state, :label, :author, :publish_date

  def initialize(publisher, publish_date, cover_state, archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
    @Publish_date = publish-date
  end
end

# Add unit tests for all implemented methods.

# The following options should be available:
#   List all books
#   Add a book
# Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
#   books table (add all properties and associations from the parent Item class as table columns)
