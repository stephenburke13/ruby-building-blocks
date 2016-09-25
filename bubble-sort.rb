def bubble_sort(array)
	array.each do |n|
		counter = 1
		# counter adds efficiency - if the code stops doing anything, it returns
		array.each_with_index do |num, index|
			if counter == array.length 
				return array
			elsif array[index+1] && num > array[index+1]
				array[index], array[index+1] = array[index+1], array[index]
			else 
				counter += 1
			end
		end
		puts array.to_s
	end
	return array
end

def bubble_sort_by(array)
	array.each do |n|
		array.each_with_index do |string, index|
			if array[index+1] && yield(array[index], array[index+1]) > 0 
				array[index],array[index+1] = array[index+1],array[index]
			end
		end
	end
	p array
end

bubble_sort_by(["hi","stephen", "h", "kjhasdkjjasjkdsakj","hello","hey"]) do |left,right|
    left.length - right.length
end

# p bubble_sort([4,3,78,2,0,2,1,76,43,90,12,1,45,23,12,1,2,67,90,5,1000,1001,6,5000])