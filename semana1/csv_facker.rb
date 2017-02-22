require 'csv'
require 'faker'

class Person
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

end
#llenado de lista de personas para llenar el archvio csv

def fill_people(num)
persons = Array.new
	num.times do
		persons << Person.new
	end
persons
end

#clase inializar archivo de salida y array donde esta almacenada la informacion
class PersonWriter
	def initialize(file, list)
		@file = file
		@list = list
	end

#metodo para crear el archvio Csv
def create_csv
	CSV.open(@file, "wb") do |csv|
		@list.each do |people|
			csv << [people.first_name, people.last_name, people.email, people.phone, people.created_at]
		end
    end
 end
end

#clase para leer un archvi csv
class PersonParser
	def initialize(file)
		@file = file
		@array_contener = Array.new
	end
     #Generas nuevos objetos de la clase people con los valores que aparecen en cada columna 
     # y se manda a un arreglo esto se hace siempre que se quieren obtener los datos
	
	def people
	    CSV.foreach(@file) do |row|
	      @array_contener << Person.new(row[0],row[1],row[2],row[3],row[4])
	    end
	   p @array_contener 
	  end     
end


class Modify
	def initialize(file,people)
		@file = file
		@people = people  

    end
    
    def change
      puts "¿a quien deseas buscar?"
      search_person = gets.chomp
      puts "¿Cual es el nuevo correo?"
      search_data = gets.chomp
      @people.each do |item|
        if search_person == item.first_name
          item.email = (search_data) 
        end  
      end
   p @people 
  end 
 
   def refresh
	  CSV.open(@file, "wb") do |csv|
		@people.each do |people|
			csv << [people.first_name, people.last_name, people.email, people.phone, people.created_at]
		end
      end
    end
end
   


person_writer= PersonWriter.new("people.csv", fill_people(20))
person_writer.create_csv

parser = PersonParser.new("people.csv")
people = parser.people

ejemplo = Modify.new("people.csv",people)
ejemplo.change
ejemplo.refresh


