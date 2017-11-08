# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    # O(log n)
    if @root && @root.value
      BinarySearchTree.insert!(@root, value)
    else
      @root = BSTNode.new(value)
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value

    if value > tree_node.value
      find(value, tree_node.right)
    else
      find(value, tree_node.left)
    end
  end

  def delete_max(node)
    return nil unless node
    return node.left unless node.right
    node.right = delete_max(node.right)

    node
  end

  def delete(value)
    # Hibbard Deletion
    node = find(value)
    return nil unless node
    parent_node = find_parent(@root, value)

    if node.value == value
      # no children
      if node.left.nil? && node.right.nil?
        if parent_node.nil?
          @root = nil
        else
          value <= parent_node.value ? parent_node.left = nil : parent_node.right = nil
        end
      end
      # 1 child
      if node.left.nil? || node.right.nil?
        if parent_node.nil?
          @root = nil
        else
          child_node = node.left || node.right
          if value <= parent_node.value
            parent_node.left = child_node
          else
            parent_node.right = child_node
          end
        end
      end
      # 2 children
      if node.left && node.right
        left_node = node.left
        r = maximum(node.left)
        
        if r.left
          left_node.right = r.left
        end
        
        r.right = node.right
        r.left = left_node
        value <= parent_node.value ? parent_node.left = r : parent_node.right = r
      end
    end

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
  end

  def minimum(tree_node = @root)
    return tree_node if tree_node.left.nil?
    minimum(tree_node.left)
  end

  def depth(tree_node = @root)
    if tree_node.nil?
      return -1
    else
      left_depth = depth(tree_node.left)
      right_depth = depth(tree_node.right)

      if left_depth > right_depth
        return left_depth + 1
      else
        return right_depth + 1
      end
    end
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    left = depth(tree_node.left)
    right = depth(tree_node.right)
    return false if (left - right).abs > 1
    
    if is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true
    end
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    # each step continually mutates the arr
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
  end

  def find_parent(node, value)
    return nil unless node
    return nil if node.value == value
    return node if node.left && node.left.value == value
    return node if node.right && node.right.value == value
    find_parent(node.left, value) || find_parent(node.right, value)
  end

  # optional helper methods go here:
  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value > node.value
      if node.right
        BinarySearchTree.insert!(node.right, value)
      else
        node.right = BSTNode.new(value)
      end
    elsif node.left
      BinarySearchTree.insert!(node.left, value)
    else
      node.left = BSTNode.new(value)
    end
    node.value
  end

  def self.max(node)
    return nil unless node
    if node.right
     return max(node.right)
    end
    node
  end

  def self.delete_max(node)
    return nil unless node
    return node.left unless node.right
    node.right = delete_max(node.right)

    node
  end

  def self.delete!(node, value)
    return nil unless node
    # debugger
    if node.value == value

      if node.left.nil? && node.right.nil?
        # debugger
        p 'hello?!?!?!'
        p_node = BinarySearchTree.find_parent(root, value)
        p p_node
        if value <= p_node.value
          node.left = nil
        else
          node.right = nil
        end
      end

      return node.left unless node.right
      return node.right unless node.left

      # debugger
      r = max(node.left)
      # set replacement new right
      r.right = node.right
      # set replacement new left while getting rid of itself.
      r.left = delete_max(node.left)

      return r

    elsif value < node.value
      node.left = delete!(node.left, value)
    else
      node.right = delete!(node.right, value)
    end

    node
  end



end
