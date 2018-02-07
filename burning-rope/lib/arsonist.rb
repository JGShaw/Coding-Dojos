require 'rope'
require 'point'

class Arsonist
  def burn(rope, x, y)
    return -1 unless rope.rope?(x, y)

    current = Point.new(x, y, 0)
    frontier = []
    explored = []

    while current
      explored << current
      x = current.x
      y = current.y
      distance = current.distance + 1
      add_to_queue(frontier, explored, rope, x - 1, y, distance)
      add_to_queue(frontier, explored, rope, x + 1, y, distance)
      add_to_queue(frontier, explored, rope, x, y - 1, distance)
      add_to_queue(frontier, explored, rope, x, y + 1, distance)
      current = frontier.pop
    end
    explored.map(&:distance).max
  end

  private

  def add_to_queue(frontier, explored, rope, x, y, distance)
    point = Point.new(x, y, distance)
    seen_before = frontier.include?(point) || explored.include?(point)
    frontier.push(point) if !seen_before && rope.rope?(x, y)
  end
end
