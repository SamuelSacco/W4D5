def bad_two_sum(array, target)
    output = []

    (0...array.length).each do |i|
        (i + 1...array.length).each do |j|
            if array[i] + array[j] == target
                output << [i, j]
            end
        end
    end

    output
end

# p bad_two_sum([2,1,4,5,3,6,7,8,10,9], 10) # O(n^2)
# p bad_two_sum([1,2,3,4,5,6,7,8,9,10], 10) # O(n^2)


def okay_two_sum?(nums, target)
    output = []
    i = 0
    j = nums.length - 1
    
    while i != j
        sum = nums[i] + nums[j]

        if sum == target
            output << [i, j]
        end 

        if sum <= target
            i += 1
        else
            j -= 1
        end
    end

    output
end

# p okay_two_sum?([1,2,3,4,5,6,7,8,9,10], 10)




=begin 
    hash allows us to check in constant time ex hash[x] => value || nil => O(1)
    array = [1,2] target = 3
    hash = {1: ??, 2: ??}
    hash
=end
def hash_sum(nums, target) #
    hash = Hash.new
    output = []

    nums.each do |num|
        hash[num] = true
    end
    
    (0...nums.length).each do |i|
        if hash[target - nums[i]]
            output << [nums[i], target - nums[i]]
        end
    end
    output
end

p hash_sum([1,2,3,4,5,6,7,8,9,10], 10)