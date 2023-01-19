require_relative '../item'
# Create a Label class with an association to the Item class (in a separate .rb file).
class Label
  # All Label class properties visible in the diagram should be defined and set up in the constructor method.
  attr_accessor :title, :color, :id, :items

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
    @items.push(item)
    item.label(self)
  end

  # All data should be preserved by saving collections in .json files
  def as_json()
    {
      title: @title,
      color: @color
    }
  end
end

# Add unit tests for all implemented methods.
