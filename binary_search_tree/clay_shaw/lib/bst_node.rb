class BSTNode
  attr_accessor :left, :right, :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end
end
