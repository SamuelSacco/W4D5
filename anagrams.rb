def first_anagram?(string1, string2)
    output = []
    (0...string1.length).each do |i|
        (i...string1.length).each do |j|
            sub = string1[i..j]
            output << sub
        end
    end

    output.include?(string2)
end

first_anagram?("hello", "lo") # O(n^2)


def second_anagram?(string1, string2)
    str1_arr = string1.split("")
    str2_arr = string2.split("")

    (0...str1_arr.length).each do |i|
        letter = str1_arr[i]
        idx = str2_arr.index(letter)
        if idx != nil
            str2_arr.delete_at(idx)
        end
        return true if str2_arr.empty?
    end

    return false
end

second_anagram?("hello", "hello") # O(n^2)

def split_string(string)
    return string.split("") if string.is_a?(String)
    return string
end

def quick_string(string)
    str_arr = split_string(string)
    return str_arr if str_arr.length <= 1
    pivot = str_arr[0]
    left_array = quick_string(str_arr[1..-1].select {|el| el < pivot})
    right_array = quick_string(str_arr[1..-1].select {|el| el >= pivot})
    left_array + [pivot] + right_array
end

def third_anagram(string1, string2)
    quick_string(string1) == quick_string(string2) # O(n^2)
end

third_anagram("hello", "lolhe")

def fourth_anagrams(string1, string2)
    counter_hash = Hash.new(0)

    string1.each_char.with_index do |char, i|
        counter_hash[char] += 1
        counter_hash[string2[i]] -=1
    end

    counter_hash.values.all?(0)
end