require 'csv'

#leer archivo 

#
 # CSV.foreach('people2.csv') do |row| 

 #   puts row.inspect
 # end

# pasar de un string a CSV 
# a_string = "Dan,34\nMaria,55"
#  p CSV.parse(a_string)

p CSV.parse(File.read('people2.csv'))
#p CSV.read('people2.csv')

#  new_customers = CSV.read('lista.csv'), {:col_sep => ';'}
#  CSV.foreach('lista.csv', {:col_sep => ";" }) {|row| p row}


#pasar a numerico, por naturaleza csv es string
# average_money_spent =  Array.new
#  CSV.foreach('customers.csv', converters: :numeric) do |row|
#  	average_money_spent << row[2]/row[1]
#  end
#  p average_money_spent

# customer = Array.new
#  customers_array = CSV.read('people2.csv')
#  customers_array.each do |people|
#  	customer << people(row[0])
#  end

#  p customer


require 'Faker'
require 'Csv'

class Person

  attr_accessor :first_name, :last_name, :email, :phone, :created_at

  def initialize(first_name = Faker::Name.first_name, last_name = Faker::Name.last_name, email = Faker::Internet.email, phone = Faker::PhoneNumber.cell_phone, created_at = Faker::Date.backward(50))
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end
 
end

  def create_person(num)
    array = []
    (1..num).each { array << Person.new }
    array
  end


# persona = Person.new
people = create_person(10)
# create_person(2)

class Csv

  def initialize(file, people)
    @file = file
    @people = people
  end

  def create_csv
    CSV.open(@file, "a+") do |csv|
      @people.each {|person| csv << [ person.first_name, person.last_name, person.email, person.phone, person.created_at ] }
    end
  end

  def read_csv
    base = []
    CSV.foreach(@file) do |row|
      base << Person.new(row[0], row[1], row[2], row[3], row[4])
    end
    base
  end

  def edit_csv(array)
    CSV.open(@file, "wb") do |csv|
      array.each {|person| csv << [ person.first_name, person.last_name, person.email, person.phone, person.created_at ] }
    end
  end

end



csv = Csv.new("people.csv", people)

# csv.create_csv

csv.read_csv
new_info = []

csv.read_csv.map do |person|
  a = person.first_name, person.last_name, person.email, person.phone, person.created_at = "Estoy editando"
  new_info << Person.new(a[0], a[1], a[2], a[3], a[4])
end

p new_info

csv.edit_csv(new_info)






# Class CSV http://ruby-doc.org/core-2.2.2/IO.html
# Class IO http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html


