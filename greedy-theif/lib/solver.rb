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
    bags = [Bag.new(max_weight)]
    added_item = false

    items_by_ratio = @items.sort { |a, b| a.ratio <=> b.ratio }.reverse
    items_by_ratio.each do |item|
      bags.each do |bag|
        added_item = bag.add_item_if_enough_space(item)
        break if added_item
      end
      
      if added_item
        added_item = false
      else
        bag = Bag.new(max_weight)
        if bag.add_item_if_enough_space(item)
          bags << bag
        end
      end

    end
    
    bags.max_by(&:price)
  end
end
