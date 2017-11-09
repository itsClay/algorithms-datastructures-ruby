require 'byebug'

def kth_largest(tree_node, k)
  kth_node = {count: 0, correct_node: nil}
  reverse_inorder_traversal(tree_node, kth_node, k)[:correct_node]
end

def reverse_inorder_traversal(tree_node, kth_node, k)
  p kth_node
  if tree_node && kth_node[:count] < k
    # traverse right side (this side first since we will be looking for largest)
    reverse_inorder_traversal(tree_node.right, kth_node, k)

    # increment counter if we still havent hit k
    if kth_node[:count] < k
      kth_node[:count] += 1
      kth_node[:correct_node] = tree_node
    end
  
    # traverse left child to get to its "rights"
    if kth_node[:count] < k
      reverse_inorder_traversal(tree_node.left, kth_node, k)
    end
  end

  kth_node
end