class CreditCard
attr_reader :name, :number, :expiration, :cvc, :status
 
 def initialize(name, number, expiration, cvc, status)
 	@name = name
 	@number = number
 	@expiration = expiration
 	@cvc = cvc
 	@status = status
end

  def name
  	@name
  end
end
titles = ["name", "number", "expiration", "cvc", "status"]
tarjeta_uno = CreditCard.new("Amex",2345673444,"12/15",2345,[234, 567, 456, 567, 344])
tarjeta_dos = CreditCard.new("ScotiaBank",2345673744,"12/16",2845,[234, 345, 456, 567, 344])  
tajeta_tres = CreditCard.new("Bancomer",2345673444,"12/15",2645,[234, 345, 456, 567, 344])
tarjeta_cuatro = CreditCard.new("Serfin",2345473454,"12/20",1345,[234, 345, 456, 567, 344])
tarjeta_cinco = CreditCard.new("BanCoppel",2345373464,"12/18",2445,[567, 345, 456, 567, 344])
cards = [tarjeta_uno, tarjeta_dos, tajeta_tres, tarjeta_cuatro, tarjeta_cinco]




#tests 
cards.each do |card|
   puts "#{card.name} responds to:"
   puts "\tName: #{card.respond_to?(:name) == true}"
   puts "\tNumber: #{card.respond_to?(:number) == true}"
   puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
   puts "\tcvc: #{card.respond_to?(:cvc) == true}"
   puts "\tGet status: #{card.respond_to?(:status) == true}"
   puts "\tSet status: #{card.respond_to?(:status=) == true}"
   puts "\n\n"
end

printf "\n"

  puts "-----------------------------------------------------------------------------------------------"
  puts "|\tname\t|\tnumber\t| expiration\t|\tcvc\t|\t  status\t\t| "
  puts "-----------------------------------------------------------------------------------------------"
  cards.each do |card|
    if card.name.length <= 7
      puts "|#{card.name}\t\t| #{card.number}\t|\t#{card.expiration}\t|\t#{card.cvc}\t|#{card.status}\t|"
     else
       puts "|#{card.name}\t| #{card.number}\t|\t#{card.expiration}\t|\t#{card.cvc}\t|#{card.status}\t|"
    end
  end
  puts "-----------------------------------------------------------------------------------------------"










# #método para mostrar datos de tarjetas
# Tabla con datos de tarjetas

# |     name     |     number     |    expiration  |      cvc      |           status          |
# ----------------------------------------------------------------------------------------------
# |   Amex       |    2345673444  |      12/15     |      2345     | [234, 567, 456, 567, 344] |  
# |   ScotiaBank |    2345673744  |      12/16     |      2845     | [234, 345, 456, 567, 344] |  
# |   Bancomer   |    2345673444  |      12/15     |      2645     | [234, 345, 456, 567, 344] |  
# |   Serfin     |    2345473454  |      12/20     |      1345     | [234, 345, 456, 567, 344] |  
# |   BanCoppel  |    2345373464  |      12/18     |      2445     | [567, 345, 456, 567, 344] |   
