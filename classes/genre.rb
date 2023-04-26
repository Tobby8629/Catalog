class Genre
  attr_accessor :id, :name
  attr_reader :items

  def initialize(name, id = Random.rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_items(item)
    items << item
    item.genre = self if item.genre != self
  end
end
