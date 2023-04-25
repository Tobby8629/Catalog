require_relative './item'
class Author < Item
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name, id = Random.rand(1..1000))
    super(id, publish_date)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end
end
