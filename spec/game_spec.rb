require_relative '../classes/game'

describe Game do
  let(:game) { Game.new(true, DateTime.now) }

  context 'attributes' do
    it 'has a multiplayer attribute' do
      expect(game.multiplayer).to be true
    end

    it 'has a last played at attribute' do
      expect(game.last_played_at).to be_a DateTime
    end
  end

  context '#can_be_archived?' do
    it 'returns true if 2 years have passed since last played' do
      game.last_played_at = DateTime.now - (2 * 365)
      expect(game.can_be_archived?).to be true
    end

    it 'returns false if 2 years have not passed since last played' do
      game.last_played_at = DateTime.now - (1 * 365)
      expect(game.can_be_archived?).to be false
    end
  end
end