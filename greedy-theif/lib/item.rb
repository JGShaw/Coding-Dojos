class Item

  attr_reader :id, :weight, :price

  def initialize(id, weight, price)
    @id = id
    @weight = weight
    @price = price
  end

  def ratio
    @price.to_f / @weight
  end

  def to_s
    "Id: #{@id}, Weight: #{@weight}, Price: #{@price}"
  end
end
