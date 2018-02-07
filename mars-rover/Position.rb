class Position

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @links = {}
  end

  def add_link(position, direction)
    @links[direction] = position
  end

  def get_linked_position(direction)
    @links[direction]
  end

end


