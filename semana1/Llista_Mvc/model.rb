require 'csv'
 
class Task	
   attr_accessor :name, :status 

  def initialize(name, status = false)
   @name = name
   @status = status
  end	
end

class Record
  def initialize
    @list = Array.new
  end  

  def index
    CSV.foreach("file_list.csv", "r") do |row|
      @list << row
    end
    @list 
  end

  def add(val)
   @list = [val]
     CSV.open("file_list.csv", "a+") do |csv| 
       @list.each do |item|
         csv << [item.name, item.status] 
       end
     end 
  end

  def search(val)
    index.at(val.to_i) 
  end

  def delete(val)
    array = index  
    array.delete_at(val.to_i)
    update(array)  
  end 

  def complete(val)
  array = Array.new
    CSV.foreach("file_list.csv") do |row|
    	array << Task.new(row[0], row[1])
    end
    
    array.each_with_index do |item, index|
      if index == val.to_i 
        item.status = true
      end 
      array     
    end	
    
    CSV.open("file_list.csv", "wb") do |csv| 
       array.each do |item|
         csv << [item.name, item.status] 
       end
     end 
  end
  
  def update(array)
    CSV.open("file_list.csv", "wb") do |csv|
      array.each do |item|
        csv << item
      end
    end
  end

end
