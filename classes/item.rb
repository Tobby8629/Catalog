require 'date'

class Item
  attr_accessor :genre, :id, :archived, :author, :publish_date, :label

  def initialize(id, publish_date, archived: false)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
    return if label.nil?
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    current_date = Date.today.year
    publish_date = Date.parse(@publish_date).year
    current_date - publish_date > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
