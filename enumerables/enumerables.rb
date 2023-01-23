class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        # self.each {|num| prc.call(num)}
        self
    end

    def my_select(&prc)
        result = []
        self.my_each do |num|
            if prc.call(num)
                result << num
            end
        end
        result
    end

    def my_reject(&prc)
        result = []
        self.my_each do |num|
            if !prc.call(num)
                result << num
            end
        end
        result
    end

    def my_any?(&prc)
        my_select(&prc).length >= 1
    end

    def my_all?(&prc)
        my_select(&prc).length == self.length
    end
end


a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# 
# calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end
# #    # => 1
# #     #    2
# #     #    3
# #     #    1
# #     #    2
# #     #    3
   
#    p return_value  # => [1, 2, 3]