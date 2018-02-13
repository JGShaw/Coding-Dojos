require 'bag'
require 'item'

describe Bag do

  subject { Bag.new 10 }
  let(:item_1) { Item.new(1, 10, 5) }
  let(:item_2) { Item.new(2, 3, 7) }

  it 'gives false when the item does not fit' do
    subject.add_item(item_1)
    expect(subject.enough_space?(item_2)).to eq false
  end

  it 'gives true when the item does fit' do
    expect(subject.enough_space?(item_1)).to eq true
  end
  
  it 'accepts new items' do
    subject.add_item(item_1)
    subject.add_item(item_2)
    expect(subject.items).to contain_exactly(item_1, item_2)
  end

  it 'can calculate the the weight of the bag' do
    subject.add_item(item_1)
    subject.add_item(item_2)
    expect(subject.weight).to eq 13
  end

  it 'can calculate the the price of the bag' do
    subject.add_item(item_1)
    subject.add_item(item_2)
    expect(subject.price).to eq 12
  end
end
