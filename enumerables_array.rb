### `my_each`

# Extend the Array class to include a method named `my_each` that takes a block,
# calls the block on every element of the array, and returns the original array.
# **Do not use Enumerable's `each` method.** When finished, you should be able
# to write: calls my_each twice on the array, printing all the numbers twice.
class Array
    def my_each(&prc)
        i = 0 

        while i < self.length
            prc.call(self[i])
            
            i += 1
        end
        self
    end

end


# return_value = [1, 2, 3].my_each do |num|
#  puts num
# end.my_each do |num|
#  puts num
# end
# => 1
#    2
#    3
#    1
#    2
#    3

# p return_value  # => [1, 2, 3]


# my_select
# Now extend the Array class to include my_select that takes a block and returns a new array
# containing only elements that satisfy the block. Use your my_each method!

# Example:

class Array
    def my_select(&prc)
        result = []
        self.my_each do |item|
            if prc.call(item)
                result << item
            end
        end
        result
    end
end

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


class Array
    def my_reject(&prc)
        result = []
        self.my_each do |item|
            if !prc.call(item)
                result << item
            end
        end
        result
    end

end

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

class Array
    def my_any?(&prc)
        self.each do |item|
           if prc.call(item)
                return true
           end
        end
        false
    end

    def my_all?(&prc)
        self.each do |item|
            if !prc.call(item)
                return false
            end
        end
        true
    end
end

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# def flatten(array)
#     array.inject([]) do |acc, ele| 
#         if ele.is_a?(Array)
#             acc.push(*flatten(ele))
#         else acc.push(ele)
#         end
#         acc
#     end
   
# end

# class Array
#     def my_flatten
#         flatten(self)
#     end
# end

class Array
    def my_flatten
        result = []
        self.each do |ele|
            if !ele.is_a?(Array)
                result << ele
            else
                result += ele.my_flatten
            end
        end
        result
    end
end

#  array = [1, 2, 3, [4, [5, 6]], [[[7]], 8]]
#  p flatten(array)

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
#

class Array
    def my_zip(*array)
        result = Array.new(self.length) { |i| Array.new }

        (0...result.length).each do |i|
            result[i] << self[i]
        end

        (0...array.length).each do |i|
            (0...self.length).each do |j|
                result[j] << array[i][j]
            end
        end

        result
    end
end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

class Array
    def my_rotate(num=1)
        result = []
        num = num % self.length
        (num...self.length).each do |idx|
                result << self[idx]
        end

        (0...num).each do |idx|
                result << self[idx]
        end
        result

    end

end


# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

class Array
    def my_join(joiner = '')
        result = ''
        self.each_with_index do |char, i|
            if i == self.length - 1
                result += char
            else
                result += char + joiner
            end
        end
        result
    end
end

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

class Array
    def my_reverse
        result = []
        i = self.length - 1
        while i >= 0
            result << self[i]
            i -= 1
        end
        result
    end

end

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]