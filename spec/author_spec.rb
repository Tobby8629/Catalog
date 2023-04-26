require_relative '../classes/author'
describe Author do
  let(:author) { Author.new('Aubin', 'Simpeze') }

  describe '#initialize' do
    it 'should create an Author object with given first and last names' do
      expect(author.first_name).to eq('Aubin')
      expect(author.last_name).to eq('Simpeze')
    end

    it 'should generate a random id for the author' do
      expect(author.id).to be_a(Integer)
    end
  end

  describe '#add_item' do
    it 'should add an item to the author' do
      item = double
      allow(item).to receive(:author=).with(author)
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end
end