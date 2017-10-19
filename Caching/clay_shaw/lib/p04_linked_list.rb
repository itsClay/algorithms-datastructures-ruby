class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    nxt = @next
    prev = @prev
    @next.prev = prev
    @prev.next = nxt
  end
end

class LinkedList
  include Enumerable
  def initialize
    # sentinal node
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = @head
    until current_node == nil
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end
  end

  def include?(key)
    current_node = @head

    until current_node == nil
      if current_node.key == key
        return true
      end
      current_node = current_node.next
    end
    return false
  end

  def append(key, val)
    n = Node.new(key, val)
    prev_node = @tail.prev

    n.next = @tail
    n.prev = @tail.prev

    @tail.prev = n
    prev_node.next = n
  end

  def update(key, val)
    current_node = @head

    until current_node == nil
      if current_node.key == key
        current_node.key = key
        current_node.val = val
        return val
      end
      current_node = current_node.next
    end
  end

  def remove(key)
    current_node = @head

    until current_node == nil
      prev_node = current_node.prev
      next_node = current_node.next

      if current_node.key == key
        next_node.prev = prev_node
        prev_node.next = next_node
      end
      current_node = current_node.next
    end
  end

  def each
    current_node = @head
    until current_node == nil
      yield current_node unless current_node == @head || current_node == @tail
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
