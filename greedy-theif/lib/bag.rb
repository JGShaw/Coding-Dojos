class Bag
  attr_reader :items

  def initialize(max_weight)
    @max_weight = max_weight
    @items = []
  end

  def add_item_if_enough_space(item)
    result = enough_space?(item)
    add_item(item) if result
    result
  end

  def weight
    @items.inject(0) { |sum, x| sum + x.weight }
  end

  def price
    @items.inject(0) { |sum, x| sum + x.price }
  end

  private

  def enough_space?(item)
    weight + item.weight <= @max_weight
  end

  def add_item(item)
    @items << item
  end
end
