class DynamicProgramming
  # expected to get through first 4
  def initialize
    @blair_cache = {1 => 1, 2 => 2}
  end

  def blair_nums(n)
    # uncached was O(2^n)
    return nil if n < 1
    return 1 if n == 1
    return 2 if n == 2
    return @blair_cache[n] if @blair_cache[n]
    result = blair_nums(n-1) + blair_nums(n-2) + ((2 * n) - 3)
    return @blair_cache[n] = result
  end

  def frog_hops_bottom_up(n)

  end

  def frog_cache_builder(n)
    frog_cache = {
      1 => [[1]],
      2 => [[2], [1,1]],
      3 => [[1,1,1], [1,2], [2,1], [3]]
    }
    return frog_cache[n] if n < 4 && n > 0

    (4..n).each do |steps|

    end

    frog_cache.each do |jumps|
      (1..3).each do |jump|

      end
    end

    return frog_cache
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)

  end
end
