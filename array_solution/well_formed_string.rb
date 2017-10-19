def well_formed?(str)
  bracket_stack = []
  brackets = { '{': '}', '[': ']', '(': ')' }

  str.chars.each do |ch|
    if brackets.include?(ch)
      bracket_stack << ch
    elseif bracket_stack.length == 0 || brackets[bracket_stack.pop] != ch
      return false
    end
  end

  return bracket_stack.empty?
end
