require_relative 'all_methods'

describe Label do
  before :each do
    @label_a = Label.new(1, 'Label A', 'red')
    @label_b = Label.new(2, 'Label B', 'blue')
  end

  context ': When a label is created, it ' do
    it 'should be an instance of Label' do
      expect(@label_a).to be_an_instance_of Label
      expect(@label_b).to be_an_instance_of Label
    end

    it 'should add an item to the label' do
      @book = Book.new(1, '2019-01-01', 'Publisher A', 'Good')
      @label_a.add_label(@book)
      expect(@label_a.items).to include(@book)
    end
  end
end
