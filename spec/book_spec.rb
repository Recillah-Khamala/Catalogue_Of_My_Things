require_relative '../src/mem1/book'
require_relative '../src/mem1/label'
require_relative '../src/item'

# Add unit tests for all implemented methods.
describe 'Test the book class' do
  book = Book.new('Ruby', 'Israel', '2013', 'Good')

  describe 'instance of a book' do
    it 'takes parameters and returns a book object' do
      expect(book).to be_an_instance_of Book
    end
  end

  describe 'book publisher' do
    it 'returns the right book publisher' do
      expect(book.publisher).to eql('Israel')
    end
  end

  describe 'book publishing date' do
    it 'returns the right book publishing date' do
      expect(book.publish_date).to eql('2013')
    end
  end

  describe 'book cover state' do
    it 'returns the right book cover state' do
      expect(book.cover_state).to eql('Good')
    end
  end

end
