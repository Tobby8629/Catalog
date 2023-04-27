require_relative 'all_methods'

describe Game do
  let(:game1) { Game.new('2005-12-22', true, '2012-04-03', 1) }
  let(:game2) { Game.new('2021-12-22', false, '2022-12-22', 2) }

  context 'attributes' do
    it 'has a multiplayer attribute' do
      expect(game1.multiplayer).to be true
    end

    it 'has a last played at attribute' do
      expect(game1.last_played_at).to eq('2012-04-03')
    end
  end

  context '#can_be_archived?' do
    it 'returns true if 2 years have passed since last played' do
      expect(game1.can_be_archived?).to be true
    end

    it 'returns false if 2 years have not passed since last played' do
      expect(game2.can_be_archived?).to be false
    end
  end
end
