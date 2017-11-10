# Post Order Traversal:
# each node is visited AFTER its subtrees. We can do left to right or right 
# to left.
def post_order_traversal(tree_node)
  if tree_node.left
    post_order_traversal(tree_node.left)
  end

  if tree_node.right
    post_order_traversal(tree_node.right)
  end

  p tree_node
end

# Pre Order Traversal:
# each node is visited BEFORE its subtrees. We can do left to right or right 
# to left.
# 1. Visit the root node (normally output it)
# 2. Do a pre order traversal of the left subtree
# 3. Do a pre-order traversal of the right subtree
def pre_order_traversal(tree_node)
  # visit root node
  p tree_node

  if tree_node.left
    pre_order_traversal(tree_node.left)
  end

  if tree_node.right
    pre_order_traversal(tree_node.right)
  end
end


# LCA: 
# In a binary search tree, an *ancestor* of a `example_node` is a node 
# that is on a higher level than `example_node`, and can be traced directly 
# back to `example_node` without going up any levels. (I.e., this is 
# intuitively what you think an ancestor should be.) Every node in a binary 
# tree shares at least one ancestor -- the root. In this exercise, write a 
# function that takes in a BST and two nodes, and returns the node that is the 
# lowest common ancestor of the given nodes. Assume no duplicate values.

