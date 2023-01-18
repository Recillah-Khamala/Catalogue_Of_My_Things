require_relative '../src/mem1/book'
require_relative '../src/mem1/label'
require_relative '../src/item'

# Add unit tests for all implemented methods.
describe 'Test the book class' do
  it 'Tests initialize method' do
    book = Book.new( 'Israel', '09/11/2013', 'Good')

    expect(book.publisher).to eq('Israel')
    expect(book.publish_date).to eq('09/11/2013')
    expect(book.cover_state).to eq('Good')
  end

  it 'Tests class methods' do
    test_publisher = 'Kaweesi'
    old_date = '06/08/2014'
    new_date = '03/24/2020'
    good_cover = 'good'
    bad_cover = 'bad'

    book1 = Book.new(test_publisher, good_cover, old_date)
    book2 = Book.new(test_publisher, good_cover, new_date)
    book3 = Book.new(test_publisher, bad_cover, old_date)
    book4 = Book.new(test_publisher, bad_cover, new_date)

    expect(book1.can_be_archived?).to eq(true)
    expect(book2.can_be_archived?).to eq(false)
    expect(book3.can_be_archived?).to eq(true)
    expect(book4.can_be_archived?).to eq(true)
  end

#   it 'Test the add label method' do
#     test_publisher = 'Recillah'
#     test_publish_date = '04/28/2016'
#     test_cover_state = 'Good'
#     book = Book.new(test_publisher, test_cover_state, test_publish_date)

#     test_title = 'title'
#     test_color = 'maroon'
#     label = Label.new(test_title, test_color)
#     book.add_label(label)

#     expect(book.label).to eq(label)
#   end
end
