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

end

list = [2, 3, -6, 7, -6, 7]
largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])