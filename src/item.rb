require 'date'
class Item
  attr_accessor :id, :genre, :author, :label, :source, :publish_date, :archived

  def initialize(genre, author, label, source, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @source = source
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return true if Time.now.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
