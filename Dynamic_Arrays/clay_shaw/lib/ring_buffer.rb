require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @start_idx = 0
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    # raise "index out of bounds" if @length == 0
    raise "index out of bounds" if index >= @length || index < 0
    @store[(start_idx + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    @store[(start_idx + index) % @capacity ] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0

    result = @store[ ((@length + start_idx - 1) % @capacity ) ]
    @store[ ((@length + start_idx - 1) % @capacity ) ] = nil
    @length -= 1
    # p 'popped: ', @store
    result

  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @store[ ((start_idx + @length ) % @capacity ) ] = val
    @length += 1
    # p 'pushed: ', @store
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    result = @store[start_idx]
    @store[start_idx] = nil
    @length -= 1
    @start_idx += 1
    # p 'shifted: ', @store
    result
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @start_idx -= 1
    @length += 1
    @store[ @start_idx % @capacity ] = val

    # p 'unshifted', @store
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_static_arr = StaticArray.new(@capacity * 2)
    # need some more logic to put all new values
    (0..@length -1).each do |idx|
      new_static_arr[idx] = @store[(idx + start_idx) % @capacity]
    end
    @start_idx = 0
    @store = new_static_arr
    @capacity *= 2
  end
end
