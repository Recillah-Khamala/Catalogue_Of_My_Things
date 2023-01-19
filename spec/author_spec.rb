require_relative '../src/mem3/author'
require_relative '../src/item'
require 'yaml'

describe Author do
  before :each do
    @author = Author.new('Lionel', 'Messi')
  end

  it '@author should be an instance of Author class' do
    expect(@author).to be_an_instance_of Author
  end

  it 'author first name to be "Lionel"' do
    @first_name == 'Lionel'
  end

  it 'author last name to be "Messi"' do
    @last_name == 'Messi'
  end

  # it 'should return the item passed into items' do
  #   new_item = Item.new('2020-01-01', false)
  #   @author.add_item(new_item)
  #   expect(@author.items).to include(new_item)
  # end
end
