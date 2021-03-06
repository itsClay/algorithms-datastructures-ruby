# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    @length = length
    @store = Array.new(length)
  end

  # O(1)
  def [](index)
    # if index < @length && index >= 0
      store[index]
    # else
      # raise "index out of bounds"
    # end
  end

  # O(1)
  def []=(index, value)
    # if index < @length && index >= 0
      @store[index] = value
    # else
    #   raise "index out of bounds"
    # end
  end

  protected
  attr_accessor :store
end
