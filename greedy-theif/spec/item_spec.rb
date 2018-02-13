require 'item'

describe Item do
  subject { Item.new(1, 10, 5) }

  it "stores the id" do
    expect(subject.id).to eq 1
  end
  
  it "stores the weight" do
    expect(subject.weight).to eq 10
  end

  it "stores the price" do
    expect(subject.price).to eq 5
  end


  it "calculates the ratio of price to weight" do
    expect(subject.ratio).to eq 0.5
  end
  
  it "converts to a string nicely" do
    expect(subject.to_s).to eq 'Id: 1, Weight: 10, Price: 5'
  end
end
