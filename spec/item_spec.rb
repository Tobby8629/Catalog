require './classes/item'

describe Item do
  before :each do
    @item_1 = Item.new(1, '2019-01-01')
    @item_2 = Item.new(2, '2012-06-19')
  end
  it 'should be an instance of Item' do
    expect(@item_1).to be_an_instance_of Item
    expect(@item_2).to be_an_instance_of Item
  end

  it 'should add genre' do
    @item_1.add_genre('Horror')
    expect(@item_1.genre).to eq 'Horror'
  end

  it 'should add author' do
    @item_2.add_author('Stephen King')
    expect(@item_2.author).to eq 'Stephen King'
  end

  it 'should add label' do
    @item_1.add_label('Favorite')
    expect(@item_1.label).to eq 'Favorite'
  end

  it 'should be able to be archived' do
    expect(@item_2.can_be_archived?).to eq true
  end

  it 'should not be able to be archived' do
    expect(@item_1.can_be_archived?).to eq false
  end

  it 'should be archived' do
    @item_2.move_to_archive
    expect(@item_2.archived).to eq true
  end

  it 'should not be archived' do
    @item_1.move_to_archive
    expect(@item_1.archived).to eq false
  end
  
end
