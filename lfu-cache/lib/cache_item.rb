class CacheItem
  attr_accessor :value, :uses, :lastAccessed
  def initialize value
    @value = value
    @uses = 0
    @lastAccessed = 0
  end
end
