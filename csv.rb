require 'faker'
require "csv"
 
class People
  attr_accessor :first_name, :last_name, :email, :phone, :created_at
 
  def initialize(first_name = Faker::Name.first_name, last_name = Faker::Name.last_name, email = Faker::Internet.email, phone = Faker::PhoneNumber.phone_number, created_at = Faker::Time.between(DateTime.now - 1, DateTime.now) )
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end
 
  def to_s
    "#{@first_name} #{@last_name} #{@email} #{@phone} #{@created_at}"
  end
 
end
 
def people(num)
  persons = []
  num.times do
    persons << People.new
  end
  persons
end
 
class PersonWriter
#clase para crear un archivo csv se inicializa con un archivo y el arreglo en el que estan los datos 
  def initialize(file, list)
    @file = file
    @list = list
  end
 
  #Metodo para crear el archivo csv 
  def create_csv
    #wb siempre va, asi es la sintaxis no es un nombre de variable
    CSV.open(@file, "wb") do |csv|
      @list.each do |people|
        csv << [people.first_name, people.last_name, people.email, people.phone, people.created_at]
      end
    end
  end
end
 
 #clase para leer un csv 
class PersonParser
  def initialize(file)
    @file = file 
  end  
 
  def personas
    array_library = []
    #Sintaxis para buscar en el archivo csv y leerlo
    CSV.foreach(@file) do |row|
      #Generas nuevos objetos de la clase people con los valores que aparecen en cada columna 
      #y se manda a un arreglo esto se hace siempre que se quieren obtener los datos
      array_library << People.new(row[0],row[1],row[2],row[3],row[4])
    end
    array_library
 
  end
end
 
#clase para modificar los datos dentro de un csv
class ModifyPeople
  def initialize(personas)
    @personas = personas
  end 
 
 
  def search_people
    puts "¿a quien deseas buscar?"
    search_person = gets.chomp
    puts "¿Cual es el nuevo correo?"
    search_data = gets.chomp
    @personas.each do |serch|
      if search_person == serch.first_name
         serch.email = (search_data) 
      end  
    end
    p @personas 
  end 
 
 
end  
 
 
  
persons = people(20)
 
#con objeto nuevo se crean el nombre de tu archivo csv y los "datos" de tu base de datos
person_writer = PersonWriter.new("people.csv", persons)
#aqui llamas al metodo para crear tu archivo csv
p person_writer.create_csv
 
# parser = PersonParser.new('people.csv')
# personas = parser.personas
 
# objeto1 = ModifyPeople.new(personas)
# objeto1.search_people