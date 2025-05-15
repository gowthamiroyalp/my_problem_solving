# 7. Reverse Integer
# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

# Example 1: Input: x = 123, Output: 321
# Example 2: Input: x = -123, Output: -321
# Example 3: Input: x = 120, Output: 21
 
# Constraints: -231 <= x <= 231 - 1

require 'pry'
def reverse(x)
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

# Time complexity:
# O(n), where n is the number of digits in x (maximum 10 for 32-bit integer).
# String conversion and reversal are linear in number of digits.

# Space Complexity: 
# O(n) due to intermediate string storage for digits.

def reverse1(x)
  int_min = -2**31
  int_max = 2**31 - 1

  reversed = x.to_s.reverse.to_i
  reversed = x < 0 ? -reversed : reversed

  (reversed < int_min || reversed > int_max) ? 0 : reversed
end

# Optimal Solution (without using strings)
# ⏱ Time Complexity:
# O(n) — we process each digit once, where n is the number of digits (max 10).

# 🧠 Space Complexity:
# O(1) — only constant space used (no strings or arrays).

def reverse2(x)
  int_min = -2**31
  int_max = 2**31 - 1

  rev = 0

  while x != 0
    digit = x % 10
    x = x / 10

    # Fix digit extraction for negative numbers
    if digit < 0 && x > 0
      digit += 10
      x -= 1
    elsif digit > 0 && x < 0
      digit -= 10
      x += 1
    end

    # Check for 32-bit overflow
    if rev > int_max / 10 || (rev == int_max / 10 && digit > 7)
      return 0
    end
    if rev < int_min / 10 || (rev == int_min / 10 && digit < -8)
      return 0
    end

    rev = rev * 10 + digit
  end

  rev
end

#runner/exection of method
puts reverse2(23)
puts reverse2(-2450)
puts reverse2(+26)

