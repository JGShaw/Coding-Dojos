# frozen_string_literal: true

require 'airport'

describe Airport do
  it 'Example test case 1' do
    expect(subject.run(2, 3, 5, 2, 15)).to eq [5, 7, 0, 1]
  end

  it 'Example test case 2' do
    expect(subject.run(3, 2, 3, 5, 10)).to eq [6, 5, 0, 3]
  end

  it 'Example test case 3' do
    expect(subject.run(4, 6, 6, 2, 18)).to eq [7, 12, 0, 1]
  end
end
