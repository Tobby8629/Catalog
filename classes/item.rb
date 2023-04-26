class Item
  attr_accessor :genre, :id, :archive, :author, :source, :label, :date

  def initialize(id = Random.rand(1..1000), archive: false)
    @id = id
    @archive = archive
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(_source)
    @label = label
  end

  def can_be_archived?
    current_date = Date.today.year
    publish_date = Date.parse(@publish_date).year
    current_date - publish_date > 10
  end

  def move_to_archive
    return unless can_be_archive == true

    @archive = true
  end
end
