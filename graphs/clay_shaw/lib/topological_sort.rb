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

    in_degrees[vertex] = vertex.in_count

  end

  # put every node/vertex in and then out
  # O(|E|) all edge sets for second loop
  until top.empty?
    current = top.shift
    sorted << current

    current.out_edges.each do |edge|
      destination = edge.to_vertex
      # p destination

      # take edge out of the graph
      in_degrees[destination] -= 1



      if in_degrees[destination] == 0
        top.push(destination)
        # in_degrees[destination] += 1
      end
    end
    # remove vertex from graph
    # in_degrees.delete(current)
  end

  if sorted.length != vertices.length
    return []
  else
    return sorted
  end
end
