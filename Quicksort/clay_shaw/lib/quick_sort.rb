class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.shift
    left = []
    right = []


    array.each do |el|
      if el <= pivot
        left << el
      else
        right << el
      end
    end

    return QuickSort.sort1(left) + [pivot] + Quicksort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b}
    pivot = array[start]
    barrier = start + 1

    (barrier...length).each do |i|
      if prc.call(array[i], pivot) < 1
        array[barrier], array[i] = array[i], array[barrier]
        barrier += 1
      end
    end
    array[start], array[barrier -1] = array[barrier -1], array[start]
    barrier -1
  end
end
