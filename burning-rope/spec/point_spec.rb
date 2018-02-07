require 'point'

describe Point do
  subject { Point.new(1, 3, 10) }

  it 'stores the x value' do
    expect(subject.x).to eq 1
  end

  it 'stores the y value' do
    expect(subject.y).to eq 3
  end

  it 'stores the distance value' do
    expect(subject.distance).to eq 10
  end

  it 'subjects with the same x and y are equal' do
    expect(subject).to eq Point.new(1, 3, 4)
  end

  it 'subjects with the different x and y are not equal' do
    expect(subject).not_to eq Point.new(2, 3, 10)
  end
end
