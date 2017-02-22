class TasksView
	def index(task)
    puts "Stuff's to do"
    Task.all.each_with_index do |item, index| 
      if item.status == "incompleta"
        puts "#{index + 1}.[], #{item.name}"
      else
        puts "#{index + 1}.[X], #{item.name}"
      end
    end      	

  end

  def create(task)
    puts "The task: \"#{task}\" has been added"    
  end

  def delete(task)
    puts "The task: \"#{task}\" has been delete"
  end

  def update(task)
    puts "The task: \"#{task}\" has been complete"
  end

	def error(task)
	  puts task
  end
end
