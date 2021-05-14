# require "byebug"

def my_min(array)
    (0...array.length).each do |i|
        max = true
        el = array[i]
        (0...array.length).each do |j|
            el2 = array[j]
            if el > el2
                max = false
            end
        end
        return el if max
    end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min(list)  # TIME COMPLEXITY O(n^2)

def my_min_2(array)
    min = array.first

    (0...array.length).each do |i|
        el = array[i]
        if min > el
            min = el
        end
    end
    min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min_2(list)  # TIME COMPLEXITY O(n)

def largest_contiguous_subsum(array)
    res = []
    (0...array.length).each do |i|
        (i+1...array.length).each do |j|
            res << array[i..j]
        end
    end
    res.map(&:sum).max
end

list = [2, 3, -6, 7, -6, 7]
largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# O(n^2)


=begin 
Step 1) set current sum to running sum of numbers
Step 2) set larget sum = current sum IF largest < current
        running sum needs to  reset
=end
def largest_contiguous_subsum(array)
    current_sum = array.first
    max_sum = array.first
    (1...array.length).each do |i|
        el = array[i]
        if current_sum < 0
            current_sum = 0
        end
        current_sum += el
        if max_sum < current_sum
            max_sum = current_sum
        end
    end
    max_sum
end
p largest_contiguous_subsum([-5, -1, -3])