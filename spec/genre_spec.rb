require_relative 'all_methods'

describe Genre do
  before :each do
   @genre = Genre.new( 'hip-pop')
  end
  context ':When music is created' do
    it 'to be an instance of Genre' do
      expect(@genre).to be_an_instance_of Genre
    end

    it 'should add to items array' do
      music = MusicAlbum.new('takecare', 'hip-pop', true, 'drake', '2004-12-12')
      @genre.add_items(music)
      expect(@genre.items).to include(music)
    end
  end
end
