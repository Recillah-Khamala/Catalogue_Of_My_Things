require_relative '../src/mem1/book'
require_relative '../src/mem1/label'
require_relative '../src/item'

# Add unit tests for all implemented methods.
describe 'Test the book class' do
  label = Label.new('Rich Dad Poor dad', 'White')

  describe 'instance of a label' do
    it 'takes parameters and returns a label object' do
      expect(label).to be_an_instance_of Label
    end
  end

  describe 'Title of the label' do
    it 'returns the right title of the label' do
      expect(label.title).to eql('Rich Dad Poor dad')
    end
  end

  describe 'Color of the label' do
    it 'returns the right color of the label' do
      expect(label.color).to eql('White')
    end
  end

  describe 'Test for the add item method' do
    it 'adds an item' do
      item = Item.new('2000', false)
      label.add_item(item)
      expect(label.items.count).to eq(1)
    end
  end
end
