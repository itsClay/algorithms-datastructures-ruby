class Vertex
  attr_reader :value, :in_edges, :out_edges

  def initialize(value)
  # typically reppd by dots
  # we pick one or the other, @in_edge or @out_edge depending on how we implement
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def in_count
    @in_edges.length
  end

end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost

    to_vertex.in_edges << self
    from_vertex.out_edges << self
  end

  # set edge should also be in graph class for easier accessibility

  def destroy!
    @to_vertex.in_edges.delete(self)
    @from_vertex.out_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
  end
end

# Kahn's Algorithm
# 1. Init a queue
# 2. push in all vertices that have no edges
# 3. when complete, pop out all vertices and examine
# 4. place current vertices in a sorted array.
# 5. As we pop we need to see all OUT edges on each element as we pop
# 6. if destination has no more (IN) edges, push that element onto the queue
# 7 push that into our results array
# 8. continue until there is nothing left in our queue

# Adjacency matrix are also useable without the Vertex and Edge class
#   ______________
#  |   A  B  C  D
#  |A  0  1
#  |B  1  0
#  |C        0
#  |D           0
