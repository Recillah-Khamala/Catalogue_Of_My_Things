require 'date'
class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :label, :genre

  def initialize(publish_date, archived)
    @id = Random.rand(1..100)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return true if Time.now.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end
