module Enumerable
	def my_each
		for i in self
			yield(i)
		end
		self
	end

	def my_each_with_index
		index = 0
		for i in self
			yield(i, index)
			index += 1
		end
		self
	end

	def my_select
		result = []
		self.my_each do |i|
			if yield(i)
				result << i
			end
		end
		result
	end

	def my_all?
		result = true
		self.my_each do |i|
			if !yield(i)
				result = false
				return result
			end
		end
		result
	end

	def my_any?
		self.my_each do |i|
			if yield(i)
				return true
			end
		end
		false
	end

	def my_none?
		self.my_each do |i|
			if yield(i)
				return false
			end
		end
		true
	end

	def my_count
		result = 0
		self.my_each do |i|
			if yield(i)
				result += 1
			end
		end
		result
	end

	def my_map(proc)
		result = []
		self.my_each do |i|
			if proc && block_given?
				result << proc.call(yield(i))
			else
				result << proc.call(i)
			end
		end
		result
	end

	def my_inject
		result = self[0]
		self.my_each_with_index do |i, index|
			if index == 0
				next
			else
				result = yield(result, i)
			end
		end
		result
	end
end

def multiply_els(array)
	array.my_inject{|running_total, item| running_total * item}
end

test_proc = Proc.new {|item| item + 1}
test_array = [1,2,8,10,20,4,6,3,6]
test_hash = {:name => "Stephen", :age => 25, :city => "New York"}
# p test_array.my_map(&test_proc)
p test_array.my_map(&test_proc) {|item| item + 5}



