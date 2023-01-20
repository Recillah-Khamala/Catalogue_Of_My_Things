require 'date'
class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :label, :author, :genre

  def initialize(publish_date, archived)
    @id = Random.rand(1..100)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    date = Date.parse(@publish_date)
    return true if Time.now.year - date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end
