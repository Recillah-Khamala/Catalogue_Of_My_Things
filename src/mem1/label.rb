require_relative '../item'
# Create a Label class with an association to the Item class (in a separate .rb file).
class Label
  # All Label class properties visible in the diagram should be defined and set up in the constructor method.
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  # Implement methods:
  #   add_item method in the Label class
  #     should take an instance of the Item class as an input
  #     should add the input item to the collection of items
  #     should add self as a property of the item object (by using the correct setter from the item object)
  def add_item(item)
    @items << item
    item.label = self
  end
end

# Implement methods:
#   add_item method in the Label class
#     should take an instance of the Item class as an input
#     should add the input item to the collection of items
#     should add self as a property of the item object (by using the correct setter from the item object)
# Add unit tests for all implemented methods.
# The following options should be available:
# List all labels (e.g. 'Gift', 'New')
# All data should be preserved by saving collections in .json files
# Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
# labels table
