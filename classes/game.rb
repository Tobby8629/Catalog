require_relative './item'
class Game
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super(date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archive?
    return true if Item.can_be_archive && @last_played_at > 2
  end
end
