class Rope
  def initialize(input)
    @rope = input
  end

  def rope?(x, y)
    inside_boundries = x >= 0 && x < @rope.size && y >= 0 && y < @rope[x].size
    inside_boundries && @rope[x][y] == 'R'
  end
end
