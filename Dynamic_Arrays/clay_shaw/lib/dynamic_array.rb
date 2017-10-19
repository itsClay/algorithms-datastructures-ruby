require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if @length == 0
    raise "index out of bounds" if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if index >= @length
    @store[index] = value
  end

  # O(1)
  def pop
    result = @store[@length - 1]
    @store[@length] = nil
    @length -= 1
    result
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    result = @store[0]
    (0..@length - 1).each do |i|
      @store[i] = @store[i+1]
    end
    @length -= 1
    result
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    (0..@length - 1).each do |i|
      @store[@length - i] = @store[@length - i - 1]
    end
    @store[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)

  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    new_static_arr = StaticArray.new(@capacity)
    # need some more logic to put all new values
    @length.times do |idx|
      new_static_arr[idx] = @store[idx]
    end
    @store = new_static_arr
  end
end
