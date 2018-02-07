require_relative 'Position.rb'

def generate_wrapped_grid_map(width, height, start_x, start_y)

  positions = {}

  (0..width).each do |x|
    (0..height).each do |y|
      positions[[x,y]] = Position.new(x, y)
    end
  end

  (0..width).each do |x|
    (0..height).each do |y|
      position = positions[[x,y]]
      north_position = positions[[x, (y > 0 ? y : height) - 1]]
      position.add_link(north_position, 'N')
      
      south_position = positions[[x, (y < (height - 1) ? y + 1 : 0)]]
      position.add_link(south_position, 'S')

      east_position = positions[[(x < (width - 1) ? x + 1 : 0), y]]
      position.add_link(east_position, 'E')

      west_position = positions[[(x > 0 ? x : width) - 1, y]]
      position.add_link(west_position, 'W')
    end
  end

  return positions[[start_x, start_y]]
end
