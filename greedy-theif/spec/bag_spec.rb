require 'bag'
require 'item'

describe Bag do

  subject { Bag.new 10 }
  let(:item_1) { Item.new(1, 10, 5) }
  let(:item_2) { Item.new(2, 3, 7) }

  it 'can add items when there is enough space' do
    expect(subject.add_item_if_enough_space(item_1)).to eq true
    expect(subject.items.length).to eq 1
  end

  it 'cannot add items when there is not enough space' do
    subject.add_item_if_enough_space(item_1)
    expect(subject.add_item_if_enough_space(item_2)).to eq false
    expect(subject.items.length).to eq 1
  end
 
  context 'calculating bag properties' do 
    subject { Bag.new 1000 }
    it 'can calculate the the weight of the bag' do
      subject.add_item_if_enough_space(item_1)
      subject.add_item_if_enough_space(item_2)
      expect(subject.weight).to eq 13
    end

    it 'can calculate the the price of the bag' do
      subject.add_item_if_enough_space(item_1)
      subject.add_item_if_enough_space(item_2)
      expect(subject.price).to eq 12
    end
  end

end
