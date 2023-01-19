require_relative '../item'

class Author
  attr_reader :first_name, :last_name
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @items = []
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(new_item)
    @items << new_item
    new_item.author = self
  end
end
