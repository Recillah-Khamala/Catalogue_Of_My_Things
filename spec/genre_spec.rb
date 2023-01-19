require_relative '../src/mem2/genre'
require_relative '../src/item'
describe Genre do
  context 'when testing genre class do' do
    name = 'rock'
    genre = Genre.new(name)
    item = Item.new('2002-10-10', false)
    it 'should return an instance of the class' do
      expect(genre).to be_instance_of(Genre)
    end

    it 'should return name instance of the genre class ' do
      expect(genre.name).to equal(name)
    end

    # it 'should return the item passed into genre items array' do
    #   genre.add_item(item)
    #   expect(genre.items).to include(item)
    # end
  end
end
