class Item
    attr_accessor :publish_date, :id, :archived, :labels, :authors, :genres

    def initialize(publish_date, id: rand(1..100), archived: false)
      @id = id
      @genres = nil
      @authors = nil
      @labels = nil
      @source = nil
      @publish_date = publish_date
      @archived = archived
    end

    def genres
        @genres = genres
    end

    def authors
        @authors = authors
    end

    def labels
        @labels = labels
    end

    def source
        @source = source
    end

    def can_be_archived?
        if Time.now.year - @publish_date.year > 10
            return true
        else
           return false 
        end
    end

    def move_to_archive
        @archived = can_be_archived?
    end

end

