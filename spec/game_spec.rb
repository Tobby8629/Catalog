require_relative '../classes/game'

describe Game do
  let(:game1) { Game.new(1, '03-05-2005', true, '02-04-2020') }
  let(:game2) { Game.new(2, '15-12-2021', false, '02-04-2022') }

  context 'attributes' do
    it 'has a multiplayer attribute' do
      expect(game1.multiplayer).to be true
    end

    it 'has a last played at attribute' do
      expect(game1.last_played_at).to eq('02-04-2020')
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
