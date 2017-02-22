class TasksController
  def initialize(args)
    @view = TasksView.new
    @input = args[0..-1]
    menu(@input)
  end

  def menu(input)
  call = @input[0]
  task = @input[1..-1].join(" ")

    case call
      when 'add' then add(task)
      when 'index' then index
      when 'delete' then delete(task)
      when 'complete' then complete(task)
    else
      @view.error 
     end     
  end
  
  def index
    @view.index(Task.all)  
  end

  def add(task)
    @view.create(task)
    Task.create(name: task, status: "incompleta")
  end

  def delete(task) 
    Task.all.each_with_index do |item, index| 
       if index + 1 == task.to_i
        id = item.id   
        @view.delete(item.name)
        Task.delete(id)         
       end
    end
  end

  def complete(task)
    Task.all.each_with_index do |item, index| 
       if index + 1 == task.to_i
        id = item.id  
        @view.update(item.name)
        Task.update(id, status: "completa")         
       end
    end
  end
end



