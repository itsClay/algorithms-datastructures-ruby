require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  pali_hash = HashMap.new
  string.chars.each do |ch|
    if pali_hash[ch]
      pali_hash[ch] += 1
    else
      pali_hash[ch] = 1
    end
  end

  if string.length.odd?
    # we need to have 1 value at odd and any amount at evens
    evens = 0
    odds = 0
    pali_hash.each do |node|
      node[1].odd? ? odds += 1 : evens += 1
    end
    return true if odds == 1
    return false
  end

  if string.length.even?
    # we need to have 1 value at odd and any amount at evens
    evens = 0
    odds = 0
    pali_hash.each do |node|
      node[1].odd? ? odds += 1 : evens += 1
    end
    return true if odds == 0
    return false
  end

end
