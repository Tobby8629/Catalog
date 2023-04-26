class Label
  attr_accessor :id, :name, :color, :items

  def initialize(id, name, color)
    @id = id || Random.rand(1000)
    @name = name
    @color = color
    @items = []
  end

  def add_label(item)
    @items << item
    item.add_label(self)
  end
end
