require 'date'
class Item
  attr_accessor :id, :publish_date, :archived, :label, :author, :genre

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
end
