class Oven
attr_reader :tray, :time_baked
  def initialize(tray,time_baked)
  	@tray = tray
  	@time_baked = time_baked
  	@array = []
  end

  def baked
  clock = 1
  puts "\n"
  puts "\t el tiempo programado del horno es de : #{@time_baked} Minutos"  
  puts "\t------------------------------------------------------"
    while clock <= @time_baked
      @tray.each do |cake|
        if cake.time_cook == clock
         puts "\n"
         puts "Es tiempo de sacar las #{cake.cant} tortas de #{cake.type}, su tiempo de horneado optimo es de: #{cake.time_cook} minutos"
        end 
       end 
      clock += 1
     end
   end

  def status_baked
  puts "\n"
  puts "\tverificando el status de las tortas al minuto: #{stop_clock = rand(@time_baked)}"
  puts "\t---------------------------------------------------" 
    @tray.each do |cake|
    	puts "\n"
      	if  cake.time_cook == stop_clock  
            puts  "#{cake.cant} tortas de #{cake.type}, estan listas"
        elsif cake.time_cook > stop_clock 
         	puts "#{cake.cant} tortas de #{cake.type}, estan crudas" 
        elsif cake.time_cook < stop_clock
         	 puts "#{cake.cant} tortas de #{cake.type} esta quemadas"
        else
             puts "#{cake.cant} tortas de #{cake.type} esta casi listas"
        end
    end 
  puts "\n"
  end
end

class Cake 
attr_reader :type, :time_cook, :cant
  def initialize(cant,type, time_cook)
  	@cant = cant
  	@type = type
  	@time_cook = time_cook
  end
end

torta_1 = Cake.new(3,"Milanesa",5)
torta_2 = Cake.new(5,"Cubana",4)
torta_3 = Cake.new(4,"Chorizo",3)
torta_4 = Cake.new(3,"Jamon",7)
torta_5 = Cake.new(1,"Aguacate",8)
tray = [torta_1, torta_2, torta_3, torta_4, torta_5]
horno = Oven.new(tray,10)
horno.baked
horno.status_baked














