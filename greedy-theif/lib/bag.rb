class Bag
  attr_reader :items

  def initialize(max_weight)
    @max_weight = max_weight
    @items = []
  end

  def enough_space?(item)
    weight + item.weight <= @max_weight   
  end

  def add_item(item)
    @items << item    
  end

  def weight
    @items.inject(0) { |sum, x| sum + x.weight }
  end

  def price
    @items.inject(0) { |sum, x| sum + x.price }
  end
end
