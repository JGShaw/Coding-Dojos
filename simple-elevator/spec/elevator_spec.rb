require 'elevator'

describe Elevator do
  context 'A valid request' do

    let(:elevator) { Elevator.new(2) }

    it 'moves the elevator down' do
      expect(elevator.goto(0)).to eq(-2)
    end

    it 'moves the elevator up' do
      expect(elevator.goto(3)).to eq(1)
    end

    it 'The elevator does not move when its already on the correct floor' do
      expect(elevator.goto(2)).to eq(0)
    end
    
    it 'the elevator should not move if we go outside of the bounds' do
      expect(elevator.goto(4)).to eq 0
    end

    it 'If the input is not given an integer then return 0' do
      expect(elevator.goto([0, 4, 5, 6])).to eq(0) 
    end

  end
end
