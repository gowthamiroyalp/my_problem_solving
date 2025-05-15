require 'pry'
# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.


# Example 1:
# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Constraints:
# 2 <= nums.length <= 104
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Only one valid answer exists.
 

#bruteforce approach which has o(n2) as time complexity and 
# space complexity as 0(1), as nothing is storing
#works even for non sorted array
def two_sum(nums, target)
	nums.each_with_index do |ele, index|
		nums.each_with_index do |inner_ele, inner_index|
			return [index, inner_index] if ele + inner_ele == target && index != inner_index
		end
		return []
	end
end

# hash/map approach, works even if no sorted arrary
#0(n) as time complexity for n iterations
#0(n) as space complexity for hash storage to return the result
def two_sum1(nums, target)
	result = {} #hash stores number as key and index as value
	nums.each_with_index do |ele, index| #each ele with index interation
		diff = target - ele #is the key logic which is the value iterated nd stored in hash, already or not
		if result.key?(diff) #the difference value as key is exist or not in the hash
			return [result[diff], index] #return the hash's value by providing diff as key and the current index
		end
		result[ele] = index #store the hash key as ele and its index as value for future check
	end
	return [] #if no such sum pair exists
end

# Sorting + Two Pointers Approach (Time: O(n log n), Space: O(n))
# if sorted array, not required sorting

# space: Still O(n) to store original indices, but no hash map used
# time: Sorting: O(n log n)
# time: Two-pointer search: O(n)

def two_sum2(nums, target)
  # Store original indices
  nums_with_index = nums.each_with_index.to_a
  # Sort array based on value
  sorted = nums_with_index.sort_by { |val, _| val }

  # sorted = nums.sort
  # binding.pry

  left = 0
  right = nums.length - 1

  while left < right
    sum = sorted[left][0] + sorted[right][0]
    if sum == target
      return [sorted[left][1], sorted[right][1]]
    elsif sum < target
      left += 1
    else
      right -= 1
    end
  end
end


#runner/exection of method
nums = [2,4,7,9]
target = 9
puts two_sum2(nums, target).inspect