require_relative 'all_methods'

describe Book do
  before :each do
    @book_a = Book.new(1, '2019-01-01', 'Publisher A', 'Good')
    @book_b = Book.new(2, '2016-06-19', 'Publisher B', 'Bad')
  end

  context ': When a book is created, it ' do
    it 'should be an instance of Book' do
      expect(@book_a).to be_an_instance_of Book
      expect(@book_b).to be_an_instance_of Book
    end

    it 'should be archived if the cover state is bad' do
      expect(@book_a.send(:can_be_archived?)).to eq(false)
      expect(@book_b.send(:can_be_archived?)).to eq(true)
    end

    it 'should have a publisher' do
      expect(@book_a.publisher).to eq('Publisher A')
      expect(@book_b.publisher).to eq('Publisher B')
    end

    it 'should have a cover state' do
      expect(@book_a.cover_state).to eq('Good')
      expect(@book_b.cover_state).to eq('Bad')
    end
  end
end
