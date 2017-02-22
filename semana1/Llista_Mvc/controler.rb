#interactua con todos lo demas 
require_relative 'model.rb'
require_relative 'view.rb'

class Controller
  def initialize(input)
 	@input = input[0..-1]
 	@model = Record.new
 	@view = View.new
 	menu(@input)
 
  end

  def menu(input) 
  	call = @input[0]
  	task = @input[1..-1].join(" ")
  	case call
      when "add" then add(task)
      when "delete" then delete(task)
      when "index" then index 
      when "complete" then complete(task)
    end
  end     
    
  def add(task)
    @model.add(Task.new(task))
    @view.showtask(task)

  end  

  def delete(task)
     @model.delete(task)
     x = @model.search(task)
     @view.show_delete(x)
    
  end      

  def index 
    all_task = @model.index
    @view.showtask_all(all_task)
  end 	

  def complete(task)
  	@model.complete(task) 
  	x = @model.search(task) 
  	@view.show_complete(x)
  end
end

input = ARGV
Controller.new(input)














