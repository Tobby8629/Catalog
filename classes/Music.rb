require_relative 'item'

class MusicAlbum < Item
 attr_accessor :name, :id, :artist, :genre, :on_spotify, :archived, :publish_date

 def initialize(name, genre, artist,answer,publish_date,id=rand(1...1000))
   super(id, publish_date)
   @name = name
   @genre = genre
   @artist = artist
   @on_spotify = on_spotify
 end

 def can_be_archived?
  parent = super
  parent == true && @on_spotify == true
end

 
end