require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms
# non-deterministic

# sparse graphs O(n)
# dense graphs O(n**2)
def topological_sort(vertices)
  sorted = []
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
