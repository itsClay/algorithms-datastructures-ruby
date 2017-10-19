class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc
    @store = Array.new
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public

  def self.child_indices(len, parent_index)
    # ex: (6, 0) => [1, 2]
    #     (6, 1) => [3, 4]
    return [1, 2] if parent_index == 0
    children = []
    left = (parent_index * 2) + 1
    right = (parent_index * 2) + 2

    if left < len
      children << left
    end
    if right < len
      children << right
    end
    return children
  end

  def self.parent_index(child_index)
    # 5 => 2
    # 4 => 1
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

# Once you've completed these methods, it's time to tackle
# ::heapyify_down. This method should take in an array,
# parent index, and a length. If the parent is greater
# than either of its two children, swap them. Continue swapping
# the node until it has reached the correct position
# (aka neither of its children are greater).
  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    idx = 0
    # need to think about where to put the prc
    while idx < len
      child_indices = self.child_indices(len, idx)
      if @store[idx] > child_indices[0]
        @store[idx], @store[child_indices] = @store[child_indices], @store[idx]
      end
      if @store[idx] > child_indices[1]
        @store[idx], @store[child_indices] = @store[child_indices], @store[idx]
      end
      idx += 1
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)

  end
end
