require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    # debugger
    if @map[key]
      node = @map.get(key)
      update_node!(node)
      # debugger
      return node.val
    else
      new_node = calc!(key)
      return new_node.val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    eject! if count == @max
    val = @prc.call(key)
    @store.append(key, val)
    @map.set(key, @store.last)

    @store.last
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    @store.remove(node.key)
    @store.append(node.key, node.val)
  end

  def eject!
    @map.delete(@store.first.key)
    @store.remove(@store.first.key)
    # debugger
  end
end
