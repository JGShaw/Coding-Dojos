require 'test/unit'
require_relative 'Rover.rb'
require_relative 'Position.rb'

class RoverTest < Test::Unit::TestCase

  def test_rover_holds_its_position
    position = Position.new(1,2)
    rover = Rover.new(position, 'N')
    assert_equal position, rover.position
    assert_equal 'N', rover.direction
  end

  def test_moving_forward_moves_the_rover_correctly
    p1 = Position.new(2, 2)
    p2 = Position.new(2, 1)
    p1.add_link(p2, 'N')
    rover = Rover.new(p1, 'N')
    rover.move('f')
    assert_equal p2, rover.position
  end

  def test_moving_backwards_moves_the_rover_correctly
    p1 = Position.new(2, 2)
    p2 = Position.new(2, 3)
    p1.add_link(p2, 'S')
    rover = Rover.new(p1, 'N')
    rover.move('b')
    assert_equal p2, rover.position
  end

  def test_turning_left_turns_the_robot_left
    position = Position.new(1,2)
    rover = Rover.new(position, 'N')
    rover.move('l')
    assert_equal 'W', rover.direction
  end

  def test_turning_left_turns_the_robot_right
    position = Position.new(1,2)
    rover = Rover.new(position, 'N')
    rover.move('r')
    assert_equal 'E', rover.direction
  end

end
