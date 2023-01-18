require_relative '../item'

# Create a Book class in a separate .rb file.
class Book < Item
  # All Book class properties visible in the diagram should be defined and set up in the constructor method.
  attr_accessor :publisher, :cover_state, :label, :author, :publish_date

  def initialize(publisher, publish_date, cover_state)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end

  # Implement methods:
  #   can_be_archived?() in the Book class
  #   should override the method from the parent class
  #   should return true if parent's method returns true OR if cover_state equals to "bad"
  #   otherwise, it should return false

  def can_be_archived?
    super || cover_state == 'bad'
  end

  # All data should be preserved by saving collections in .json files.
  def as_json()
    {
      id: @id,
      publisher: @publisher,
      publish_date: @date,
      cover_state: @cover_state,
      archived: @archived,
      label: {
        id: label.id,
        title: label.title,
        color: label.color
      },
      author: {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    }
  end
end
