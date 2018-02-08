class Point
  attr_reader :x, :y, :distance

  def initialize(x, y, distance)
    @x = x
    @y = y
    @distance = distance
  end

  def ==(other)
    @x == other.x && @y == other.y
  end
end
