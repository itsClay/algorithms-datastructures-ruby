class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    result = 0
    each_with_index do |el, i|
      result += (el.to_s.ord + i.to_s.ord).hash
    end
    result.hash
  end
end

class String
  def hash
    self.codepoints.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    res = []
    keys.each_with_index do |k, i|
      res << k.to_s.ord ** i
    end
    res.hash
  end
end
