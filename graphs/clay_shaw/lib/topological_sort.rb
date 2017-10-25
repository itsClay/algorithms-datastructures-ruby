require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms
# non-deterministic

# sparse graphs O(n)
# dense graphs O(n**2)
def topological_sort(vertices)
  sorted = []
  # breadth first search (can swap to a stack for DFS)
  top = [] #queue
  # init a graph
  in_degrees = Hash.new


  # step 1 O(|V|)
  vertices.each do |vertex|
    top.push(vertex) if vertex.in_edges.empty?
    # set up our graph
    in_degrees[vertex] = vertex.in_count
  end

  # put every node/vertex in and then out
  # O(|E|) all edge sets for second loop
  until top.empty?
    current = top.shift
    sorted << current

    current.out_edges.each do |edge|
      destination = edge.to_vertex

      # take edge out of the graph
      in_degrees[destination] -= 1
      # break here if we have a cycle
      return [] if in_degrees[destination] < 0

      if in_degrees[destination] == 0
        top.push(destination)
        # in_degrees[destination] += 1
      end
    end
  end

  # right now just handle duplicates by checking the length of the vertex
  # array against its sorted
  if sorted.length != vertices.length
    return []
  else
    return sorted
  end

end

# TARJANS usees depth first search (tracking whether or not you have
# visited vertices)
# explores nodes until they have no children or unvisited children
# Once a node's connections have been exhausted it is unshifted
# onto the result. Nodes that have later dependencies will be processed
# before those that have earlier ones.
# Each node and edge is visited once so time complexity is linear.
# catching a cycle is tricky.
