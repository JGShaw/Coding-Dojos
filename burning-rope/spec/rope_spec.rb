require 'rope'

describe Rope do
  let(:input) { ['   R  ', '   R  ', ' RRRR ', '   R  ', '   R  ', '   R  '] }
  subject { Rope.new input }

  context 'testing if rope is present' do
    it 'can tell if a section is rope' do
      expect(subject.rope?(0, 3)).to eq true
    end

    it 'can tell if a section is not rope' do
      expect(subject.rope?(1, 1)).to eq false
    end

    it 'returns false when outside of the boundries' do
      expect(subject.rope?(9, 9)).to eq false
    end
  end
end
