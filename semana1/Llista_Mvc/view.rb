class View
  def showtask(task)
    puts "Agregaste la tarea: #{task} a tu lista"
  end

  def show_delete(task)
    puts "Eliminaste la tarea: #{task[0]} de tu lista"
  end

  def show_complete(task)
    puts "Completaste la tarea: #{task[0]} de tu lista"
  end  

  def showtask_all(task)
    task.each_with_index do  |item, index| 
      if item[1] == "true"
        puts "#{index}. [X] #{item[0].to_s}"
      else
        puts "#{index}. [ ] #{item[0].to_s}" 	
      end
     end
  end

end




 