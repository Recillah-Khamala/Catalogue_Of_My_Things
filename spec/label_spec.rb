require_relative '../src/mem1/book'
require_relative '../src/mem1/label'
require_relative '../src/item'
require 'rspec'

# Add unit tests for all implemented methods.
describe 'Test the label class' do
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
end

describe Label do
  let(:label) { Label.new('Test Label', 'red') }
  let(:item) { Item.new('01/01/2010', false) }

  describe '#add_item' do
    it 'should add the input item to the collection of items' do
      label.add_item(item)
      expect(label.items).to include(item)
    end

    it 'should add self as a property of the item object' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end
