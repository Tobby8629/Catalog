require_relative 'all_methods'
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

  describe '#add_author' do
    it 'should add an author to the author' do
      item = double
      allow(item).to receive(:author=).with(author)
      author.add_author(item)
      expect(author.items).to include(item)
    end
  end
end
