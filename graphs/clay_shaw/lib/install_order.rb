# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative 'topological_sort'
require_relative 'graph'

# Since dependencies are involved, graphs are great!
def install_order(arr)
  max = arr.flatten.max
  vertices = {}

  (1..max).each do |pkg|
    vertices[pkg] = Vertex.new(pkg)
  end

  arr.each do |tuple|
    package = tuple[0]
    dependency = tuple[1]

    vertices[package]
    Edge.new(vertices[dependency], vertices[package])
  end
end
