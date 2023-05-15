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
    def my_flatten(array=nil)
        array ||= self
        if !array.is_a?(Array)
            return [array]
        end
        result = []
        array.each do |ele|
            result += my_flatten(ele)
        end
        result

    end
end

#  array = [1, 2, 3, [4, [5, 6]], [[[7]], 8]]
#  p flatten(array)

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
#