require "cache_item"

class LFUCache 

  def initialize size
    @maxSize = size
    @time= 0
    @hash = Hash.new
  end

  def put key, value
    deleteLeastUsedValue if @hash.size + 1 > @maxSize
    @hash[key] = CacheItem.new value
  end

  def deleteLeastUsedValue
    keyForMinValue = @hash.min_by { |key, value| [value.uses, value.lastAccessed] }[0]
    @hash.delete keyForMinValue
  end

  def get key
    if @hash[key] then
      @hash[key].uses+=1
      @time+=1
      @hash[key].lastAccessed = @time
      @hash[key].value
    else
      -1
    end
  end

end
