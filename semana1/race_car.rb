class RaceCar

  attr_reader :name

  def initialize(name)
    @name = name
  end


  #método para obtener velocidad promedio
  def average_speed
    laptimes = 0
    5.times do |lap|
      time = rand(1..100)
      laptimes += (100 / time)
    end
    laptimes / 5
  end

  #método que muestra nivel de cada race car
  def level
    case average_speed
    when (0..3)
      'Principiante'
    when (4..10)
      'Medio'
    when (11..50)
      'Avanzado'          
    end
  end

end

class Team < RaceCar

  attr_reader :team

  def initialize(team)
    @team = team
  end

  def average_speed_of_team
    suma_equipo = 0

    team.each do |car|
      suma_equipo += car.average_speed
    end

    suma_equipo / team.length.to_f
  end

  def team_level
    team.each do |car|
      puts "#{car.name}: #{car.level}"
    end
  end

end

car1 = RaceCar.new('Force')
car2 = RaceCar.new('Power')
car3 = RaceCar.new('Passwater')
car4 = RaceCar.new('Banjo')
car5 = RaceCar.new('Duck')


p "car1: #{car1.average_speed} m/s #{car1.level}"
#ej. car1: 9.5 m/s
p "car2: #{car2.average_speed} m/s #{car2.level}"
#ej. car2: 12.01 m/s
p "car3: #{car3.average_speed} m/s #{car3.level}"
#ej. car3: 10.65 m/s
p "car4: #{car4.average_speed} m/s #{car4.level}"
#ej. car4: 11.0 m/s
p "car5: #{car5.average_speed} m/s #{car5.level}"
#ej. car5: 10.15 m/s

#create a team of cars 
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)

  def search(name, team)
    racer = ""  
    team.team.each do |car|
      if car.name == name
        return racer = "#{car.name} is a racer"
      else
        racer = "The #{name} racer don't exists in this team"
      end
    end
    racer
  end

#test para buscar race car en equipo team_one
p search("Power", team_one) == "Power is a racer"

#calculate average speed of team
p team_one.average_speed_of_team

team_one.team_level
