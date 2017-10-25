require 'byebug'

class DynamicProgramming
  # expected to get through first 4
  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {
        1 => [[1]],
        2 => [[2], [1,1]],
        3 => [[1,1,1], [1,2], [2,1], [3]]
      }
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
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    frog_cache = {
      1 => [[1]],
      2 => [[2], [1,1]],
      3 => [[1,1,1], [1,2], [2,1], [3]]
    }
    return frog_cache if n < 4 && n > 0

    (4..n).each do |steps|
      # init if we dont have one yet
      frog_cache[steps] = [] unless frog_cache[steps]

      (1..3).each do |step|
        # each step backward we will add that step
        # ie 1 step back we add a 1 to all the combos
        frog_cache[steps - step].each do |combo|
          combo += [step]
          frog_cache[steps] += [combo]
        end
      end

    end

    return frog_cache
  end

  def frog_hops_top_down(n)
    # (1..3).each do |i|
    #   frog_hops_top_down(n -1) + i + frog_hops_top_down(n-2) + frog_hops_top_down(n - 3)
    # end
    return @frog_cache[n] if n < 4
    @frog_cache = {
        1 => [[1]],
        2 => [[2], [1,1]],
        3 => [[1,1,1], [1,2], [2,1], [3]]
      }
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    result = []
    (1..3).each do |first_step|
      frog_hops_top_down_helper(n - first_step).each do |way|
        new_way = [first_step]
        way.each do |step|
          new_way << step
        end
        result << new_way
      end
      @frog_cache
    end
  end

  def super_frog_hops(n, k)
    frog_cache = [[[]], [[1]]]

    return frog_cache[n] if n < 2

    (2..n).each do |i|
      new_way_set = []
      (1..k).each do |first_step|
        next if i - first_step < 0
        frog_cache[i - first_step].each do |way|
          # init the step
          new_way = [first_step]
          way.each do |step|
            # add in our step for each possible step outcome
            new_way << step
          end
          new_way_set << new_way
        end
      end
      frog_cache << new_way_set
    end
    frog_cache[n]
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)

  end

  def make_change()
  # another great example but not on the specs
  
  end
end
