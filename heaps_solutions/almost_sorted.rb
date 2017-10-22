## Almost sorted

# Timestamped data may not always make it into the database in the
# perfect order. Server loads, network routes, etc. Your job is to
# take in a very long sequence of numbers in real-time and efficiently
# print it out in the correct order. Each number is, at most, `k` away
# from its final sorted position. Target time complexity is `O(nlogk)`
# and target space is `O(k)`.

require_relative 'heap'

def almost_sorted(arr, k)
  result = BinaryMinHeap.new
  count = 0
  # generate the heap of size k
  k.times do
    result.push(array[count])
    count += 1
  end
  # change the value of the current array in place
  until count == arr.length - k
    arr[count - k] = result.extract
    result.push(arr[count])
    count += 1
  end

  k.times do
    arr[count - k] = result.extract
    count += 1
  end
  result
end
