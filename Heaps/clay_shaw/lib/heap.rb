require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc
    @store = Array.new
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    # debugger
    val = @store.pop
    p @store
    @store = self.class.heapify_down(@store, 0, @store.length, &prc)
    return val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    @store = BinaryMinHeap.heapify_up(@store, @store.length - 1, @store.length, &@prc)
  end

  public

  def self.child_indices(len, parent_index)
    # ex: (6, 0) => [1, 2]
    #     (6, 1) => [3, 4]
    # return [1, 2] if parent_index == 0
    children = []
    left = (parent_index * 2) + 1
    right = (parent_index * 2) + 2

    if left < len
      children << left
    end
    if right < len
      children << right
    end
    p children
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
    prc ||= Proc.new { |a, b| a <=> b }
    idx = parent_idx

    while idx < len
      children = child_indices(len, idx)
      debugger

      # set the child we will pick first
      next_child_idx = nil
      if children.empty?
        return array
      elsif children.length == 1
        next_child_idx = children[0]
      elsif children.length == 2
        # debugger
        # if array[children[0]] && array[children[1]]
        if children[0] && children[1]
          if prc.call(array[children[0]], array[children[1]]) < 1
            next_child_idx = children[0]
          else
            next_child_idx = children[1]
          end
        end
      end

      # heapify
      if array[next_child_idx] && prc.call(array[idx], array[next_child_idx]) == 1
        array[idx], array[next_child_idx] = array[next_child_idx], array[idx]
      end
      idx = next_child_idx
    end

    array
  end

# Next, implement ::heapify_up. This method will be used when adding
# a new element to the heap to make sure that it is in the correct position.
# It should take an array, a child index, and a length. Check the child
# against its parent, and swap the elements if the parent is greater.
# Continue until the node has reached the correct position.
  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new { |a, b| a <=> b }

    parent_idx = parent_index(child_idx)
    child_val = array[child_idx]
    parent_val = array[parent_idx]
    # debugger
    if prc.call(array[child_idx], array[parent_idx]) >= 0
       return array
     else
      array[child_idx], array[parent_idx] = parent_val, child_val
      heapify_up(array, parent_idx, len, &prc)
    end

  end
end
