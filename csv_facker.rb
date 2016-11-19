require 'csv'
require 'faker'

class People
attr_accessor :first_name, :last_name, :email, :phone, :created_at 
  def initialize(first_name = Faker::Name.first_name, last_name = Faker::Name.last_name, email = Faker::Internet.email, phone = Faker::PhoneNumber.phone_number, created_at = Faker::Time.between(DateTime.now - 1 , DateTime.now))
    @first_name = first_name 
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end

def to_s
	"#{@first_name}, #{@last_name}, #{email}, #{phone}, #{created_at}"
end

#llenado de lista de perosnas para llenar el archvio csv

def fill_people
persons = Array.new
	num.times do
		persons << People.new
	end
end
end


#clase icializar archivo de salida y array donde esta almacenada la informacion
class Make_File_Csv
	def initialize(file, list)
		@file = file
		@list = list
	end
end

#metodo para crear el archvio Csv
def method_make_csv
	CSV.open(@file, "wb") do |csv|
		@list.each do |people|
			csv << [people.first_name, people.last_name, people.email, people.phone, people.created_at]
		end
end
end


#clase para leer un archvi csv
class Red_File_Csv
	def initialize(file)
		@file = file
	end
     #Generas nuevos objetos de la clase people con los valores que aparecen en cada columna 
     # y se manda a un arreglo esto se hace siempre que se quieren obtener los datos
	
	def method_read_csv
	  array_contener = Array.new
	    CSV.foreach do (@file) |row|
	      array_contener << people.new(row[0],row[1],row[2],row[3],row[4])
	    end
	    p array_contener
	end
end



persons = fill_people(50)


a = Make_File_Csv("people2.csv", persons)
a.method_make_csv





