require 'csv'
attr_accessor : list 


class Model

	def initialize(List)
		@list = []
    end

	def add_item(item)
    @list << capitalize.item
	end

	def delete_item(item)
	  puts "entraste al metodo delete" + item
	end

    def update_item(index, item)
    end

	def create_csv
      CSV.open("lista_items.csv",w)
    end

    def read_csv
    end 
    
    def updte_csv
    end	


	def update(some_var)
	  puts "entraste al update" + some_var
	end
end


















