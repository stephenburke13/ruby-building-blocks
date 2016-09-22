def stock_picker(prices)
	price_difs = []
	index = 0
	results = {}
	prices.each do |price|
		inner_index = index
		each_difs = {}
		prices[index..-1].each do |inner_price|
			each_difs[inner_price - price] = [index, inner_index]
			inner_index += 1
		end
		a = each_difs.keys.max
		price_difs.push(a)
		results[a] = each_difs[a]
		index+=1
	end
	puts results[price_difs.max].to_s
end

stock_picker([17,3,6,9,15,8,6,1,13])