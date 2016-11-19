require 'csv'

CSV.foreach ('test2.csv') do |row|
	puts row.inspect
end

