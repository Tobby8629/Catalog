require_relative 'all_methods'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new('takecare', 'hip-pop', true, 'drake', '2004-12-12')
  end
  context ':When music is created' do
    it 'to be an instance of MusicAlbum' do
      expect(@music).to be_an_instance_of MusicAlbum
    end

    it 'can be archived should return true' do
      expect(@music.can_be_archived?).to eq(true)
    end
  end
end
