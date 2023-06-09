require_relative './item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, id = Random.rand(1..1000))
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today - Date.parse(@last_played_at)).to_i / 365 > 2
  end
end
