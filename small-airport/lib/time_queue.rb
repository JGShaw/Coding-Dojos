class TimeQueue
  attr_reader :total_popped
  
  def initialize(num_elements)
    @items = [0] * num_elements
    @total_popped = 0
  end

  def add(value)
    @items << value
    @items.sort!
  end

  def pop
    return unless item_ready?
    @total_popped += 1
    @items.slice!(0)
  end

  def tick
    @items.map! { |i| i - 1 }
  end

  def length
    @items.length
  end

  private

  def item_ready?
    !@items.empty? && @items[0] <= 0
  end
end
