require './classes/item'

describe Item do
  before :each do
    @item1 = Item.new(1, '2019-01-01')
    @item2 = Item.new(2, '2012-06-19')
  end
  it 'should be an instance of Item' do
    expect(@item1).to be_an_instance_of Item
    expect(@item2).to be_an_instance_of Item
  end

  it 'should add genre' do
    @item1.add_genre('Horror')
    expect(@item1.genre).to eq 'Horror'
  end

  it 'should add author' do
    author = Author.new('John', 'Doe')
    @item2.add_author(author)
    expect(@item2.author).to eq author
  end

  it 'should add label' do
    label = Label.new(1, 'Favorite', 'red')
    @item1.add_label(label)
    expect(@item1.label).to eq label
  end

  it 'should be able to be archived' do
    expect(@item2.can_be_archived?).to eq true
  end

  it 'should not be able to be archived' do
    expect(@item1.can_be_archived?).to eq false
  end

  it 'should be archived' do
    @item2.move_to_archive
    expect(@item2.archived).to eq true
  end

  it 'should not be archived' do
    @item1.move_to_archive
    expect(@item1.archived).to eq false
  end
end
