require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    self[key.hash] << key.hash
    @count += 1
  end

  def include?(key)
    self[key.hash].include?(key.hash)
  end

  def remove(key)
    self[key.hash].delete(key.hash)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = @count * 2
    old_store = @store
    new_store = Array.new(new_size) { Array.new }
    old_store.each do |bucket|
      bucket.each do |num|
        new_store[ num % new_store.length ] << num
      end
    end
    @store = new_store
  end
end
