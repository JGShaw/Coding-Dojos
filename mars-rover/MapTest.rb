require 'test/unit'
require_relative 'Map.rb'
require_relative 'Position.rb'

class PositionTest < Test::Unit::TestCase

  def test_generate_wrapped_grid_map_north_is_linked
    position = generate_wrapped_grid_map(5, 5, 2, 2)
    linked_pos = position.get_linked_position('N')
    assert_equal 1, linked_pos.y
  end

  def test_generate_wrapped_grid_map_north_is_wrapped
    position = generate_wrapped_grid_map(5, 5, 2, 0)
    linked_pos = position.get_linked_position('N')
    assert_equal 4, linked_pos.y
  end

  def test_generate_wrapped_grid_map_south_is_linked
    position = generate_wrapped_grid_map(5, 5, 2, 2)
    linked_pos = position.get_linked_position('S')
    assert_equal 3, linked_pos.y
  end

  def test_generate_wrapped_grid_map_south_is_wrapped
    position = generate_wrapped_grid_map(5, 5, 2, 4)
    linked_pos = position.get_linked_position('S')
    assert_equal 0, linked_pos.y
  end

  def test_generate_wrapped_grid_map_east_is_linked
    position = generate_wrapped_grid_map(5, 5, 2, 2)
    linked_pos = position.get_linked_position('E')
    assert_equal 3, linked_pos.x
  end

  def test_generate_wrapped_grid_map_east_is_wrapped
    position = generate_wrapped_grid_map(5, 5, 4, 2)
    linked_pos = position.get_linked_position('E')
    assert_equal 0, linked_pos.x
  end

  def test_generate_wrapped_grid_map_west_is_linked
    position = generate_wrapped_grid_map(5, 5, 2, 2)
    linked_pos = position.get_linked_position('W')
    assert_equal 1, linked_pos.x
  end

  def test_generate_wrapped_grid_map_west_is_wrapped
    position = generate_wrapped_grid_map(5, 5, 0, 2)
    linked_pos = position.get_linked_position('W')
    assert_equal 4, linked_pos.x
  end

end
