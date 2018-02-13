require 'solver.rb'

describe Solver do
  
  let(:input_file) { 'inputs/provided.in' }
  subject { Solver.new input_file }

  it 'given an input file the items are setup' do
    expect(subject.items.length).to eq 5
  end

end
