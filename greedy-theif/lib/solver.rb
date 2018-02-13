require_relative 'item'
require_relative 'bag'

class Solver
  
  attr_reader :items
  
  def initialize(file_path)
    @items = []
    File.open(file_path).each_line do |line|
      parts = line.split(' ').map(&:to_i)
      @items << Item.new(*parts)
    end
  end

  def solve_using_ratio(max_weight)
    bag = Bag.new(max_weight) 
    items_by_ratio = @items.sort { |a, b| a.ratio <=> b.ratio }.reverse
    items_by_ratio.each do |item|
      if bag.enough_space?(item)
        bag.add_item(item)
      end
    end
    bag
  end

end

solver = Solver.new('inputs/greedy.in')
puts solver.solve_using_ratio(10).items
