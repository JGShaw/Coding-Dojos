require 'arsonist'
require 'rope'

describe Arsonist do
  let(:input) { ['   R  ', '   R  ', ' RRRR ', '   R  ', '   R  ', '   R  '] }
  let(:rope) { Rope.new input }

  it 'passes test case 1' do
    expect(subject.burn(rope, 0, 3)).to eq 5
  end

  it 'passes test case 2' do
    expect(subject.burn(rope, 2, 3)).to eq 3
  end

  it 'passes test case 3' do
    expect(subject.burn(rope, 5, 3)).to eq 5
  end

  it 'passes test case 4' do
    expect(subject.burn(rope, 2, 4)).to eq 4
  end

  it 'burning where the is no rope return -1' do
    expect(subject.burn(rope, 0, 0)).to eq(-1)
  end
end
