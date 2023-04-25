require './classes/item'

describe Item do
  before :each do
    @item = Item.new
  end
  it 'should be an instance of Item' do
    expect(@item).to be_an_instance_of Item
  end
end
