require 'csv'

#leer archivo 

# CSV.foreach('customers.csv') do |row| 
#   puts row.inspect
# end

# pasar de un string a CSV 
# a_string = "Dan,34\nMaria,55"
#  p CSV.parse(a_string)

# CSV.parse(File.read('customers.csv'))
# CSV.read('customers.csv')

#  new_customers = CSV.read('lista.csv'), {:col_sep => ';'}
#  CSV.foreach('lista.csv', {:col_sep => ";" }) {|row| p row}


# pasar a numerico, por naturaleza csv es string
average_money_spent =  Array.new
 CSV.foreach('customers.csv', converters: :numeric) do |row|
 	average_money_spent << row[2]/row[1]
 end
 p average_money_spent


customers_array = CSV.read('test.txt')
customers_array.each do |customer|
	customer << average_money_spent.shift
end

p customer



