class Rope
  def initialize(input)
    @rope = input
  end

  def rope?(x, y)
    x >= 0 && x < @rope.length && y >= 0 && y < @rope[x].length && @rope[x][y] == 'R'
  end
end
