# 7. Reverse Integer
# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

# Example 1: Input: x = 123, Output: 321
# Example 2: Input: x = -123, Output: -321
# Example 3: Input: x = 120, Output: 21
 
# Constraints: -231 <= x <= 231 - 1

require 'pry'
def reverse(x)
    # binding.pry
    is_signed = false
    str = x.to_s
    is_signed = true if str[0] == '-'
    rev_str = str.reverse
    if is_signed
        res = ('-' + rev_str).to_i
    else
        res = rev_str.to_i
    end
    return res
end

puts reverse(23)
puts reverse(-20)
puts reverse(+26)
