require 'test/unit'
require_relative 'Position.rb'

class PositionTest < Test::Unit::TestCase

  def test_a_position_holds_its_x_and_y
    position = Position.new(4, 7)
    assert_equal 4, position.x
    assert_equal 7, position.y
  end

  def test_a_position_that_has_been_linked_is_accessible_in_the_map
    p1 = Position.new(4, 7)
    p2 = Position.new(2, 4)

    p1.add_link(p2, 'N')
    assert_equal p1.get_linked_position('N'), p2
  end

end
