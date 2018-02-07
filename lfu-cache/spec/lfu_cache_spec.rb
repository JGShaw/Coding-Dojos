require "lfu_cache"

describe LFUCache do
  subject { LFUCache.new 2}

  it "acts correctly as a least frequently used cache" do
    subject.put(1, 1)
    subject.put(2, 2)
    expect(subject.get 1).to eq 1
    subject.put(3, 3)
    expect(subject.get 2).to eq(-1) 
    expect(subject.get 3).to eq 3
    subject.put(4, 4) 
    expect(subject.get 1).to eq(-1)
    expect(subject.get 3).to eq 3
    expect(subject.get 4).to eq 4
  end

  it "putting a value into the cache allow it to be retrived" do
    subject.put(1, 1)
    expect(subject.get 1).to eq 1
  end

  it "getting a value that does not exist returns -1" do
    expect(subject.get 1).to eq(-1)
  end

  it "when the hash is full the least frequently used value is removed" do
    subject.put(1, 1)
    subject.put(2, 2)
    subject.get 1
    subject.put(3, 3)
    expect(subject.get 2).to eq(-1) 
  end

  it "when the hash is full and two values have been used the same amount, the last used one is removed" do 
    subject.put(1, 1)
    subject.put(2, 2)
    subject.get 1
    subject.get 2
    subject.put(3, 3)
    expect(subject.get 1).to eq(-1) 
  end

end
