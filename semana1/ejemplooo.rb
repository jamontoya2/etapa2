#RaceCar class

$distance = 100
class RaceCar
  attr_accessor :nombre, :laptimes, :lapdistance, :velocidad_promedio, :nivel_race_car

  def nombre
    
  end

  def laptimes
    
  end

  def lapdistance
    
  end

  def velocidad_promedio
    
  end

  def nivel_race_car
    
  end
end

#Team class
class Team 
  attr_accessor :new_race_car, :average_speed_of_team

  #método para agregar nuevo race car
  #...
  def new_race_car
    
  end

  #método para calcular promedio de velocidad del equipo
  #...
  def average_speed_of_team
    
  end

end

#método para buscar race car
#...
def search
  
end

#método para generar la tabla
#...
def mostrar_tabla
  
end

#método para mostrar nombre y nivel del race car
#...
def mostrar_nom_nivel
  
end

#instancias de RaceCar
#...
car1 = 
#tests

p "car1: #{car1.average_speed} m/s"
#ej. car1: 9.5 m/s
p "car2: #{car2.average_speed} m/s"
#ej. car2: 12.01 m/s
p "car3: #{car3.average_speed} m/s"
#ej. car3: 10.65 m/s
p "car4: #{car4.average_speed} m/s"
#ej. car4: 11.0 m/s
p "car5: #{car5.average_speed} m/s"
#ej. car5: 10.15 m/s
p "car6: #{car6.average_speed} m/s"
#ej. car6: 15.51 m/s

#create a team of cars 
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)

#test para buscar race car en equipo team_one
p search("Power", team_one) == "Power is a racer"

#calculate average speed of team
p team_one.average_speed_of_team
#ej. 10.66 

=begin
#método para mostrar nombre y nivel del race car
...
Ejemplo de tabla que muestra nombre y nivel del race car

|    Name        |    Nivel        |
------------------------------------
|   Force        |   Principiante  |
|   Power        |   Medio         |
|   Passwater    |   Normal        |
|   Banjo        |   Normal        |
|   Duck         |   Normal        |
=end