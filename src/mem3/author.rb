# Create an Author class with an association to the Item class (in a separate .rb file).
# All Author class properties visible in the diagram should be defined and set up in the constructor method.
# Implement methods:
# add_item method in the Author class
# should take an instance of the Item class as an input
# should add the input item to the collection of items
# should add self as a property of the item object (by using the correct setter from the item object)
# Add unit tests for all implemented methods.
# The following options should be available:
# List all authors (e.g. 'Stephen King')
# All data should be preserved by saving collections in .json files.
# Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
# authors table

class Author
  attr_reader :first_name, :last_name
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @items = []
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
