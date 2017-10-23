# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_accessor :root
  attr_reader :find

  def initialize
    @root = nil
  end

  def insert(value)
    if @root && @root.value
      BinarySearchTree.insert!(@root, value)
    else
      @root = BSTNode.new(value)
    end
  end

  def find(value, tree_node = @root)
    # debugger
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value

    if value > tree_node.value
      find(value, tree_node.right)
    else
      find(value, tree_node.left)
    end
  end

  def delete(value)
    # Hibbard Deletion
    BinarySearchTree.delete!(@root, value)
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
    return 0 if tree_node.nil? || (tree_node.left.nil? && tree_node.right.nil?)

  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
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

  def self.delete!(node, value)
    return nil unless node

    if node.value == value
      return node.left unless node.right
      return node.right unless node.left

      debugger
      r = node.left.maximum
      old_left = r.left
      r.right = node.right
      r.left = node.left


      return r

    elsif value < node.value
      node.left = delete!(node.left, value)
    else
      node.right = delete!(node.right, value)
    end

    node
  end

end
