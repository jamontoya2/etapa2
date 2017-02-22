require 'sqlite3'

class Chef
  def initialize(firts_name, last_name, birthday, email, phone, created_at = Time.now, update_at = Time.now)
    @firts_name = firts_name
    @last_name = last_name
    @birthday = birthday
    @email = email
    @phone = phone
    @created_at = created_at
    @update_at = update_at
  end  

  def self.create_table
  	Chef.db.execute(
  	  <<-SQL
  	    CREATE TABLE chefs (
  	      id INTEGER PRIMARY KEY AUTOINCREMENT,
  	      firts_name VARCHAR(64) NOT NULL,
  	      last_name VARCHAR(64) NOT NULL,
  	      birthday DATE NOT NULL,
  	      email VARCHAR(64) NOT NULL,
  	      phone VARCHAR(64) NOT NULL,
  	      created_at DATETIME NOT NULL,
  	      update_at DATETIME NOT NULL
  	    );
  	  SQL
  	)
  end	

  def self.seed
  	Chef.db.execute(
  	  <<-SQL
  	    INSERT INTO chefs
  	      (firts_name, last_name, birthday, email, phone, created_at, update_at)
  	    VALUES
  	      ('javier', 'Montoya', '1975-04-02', 'javmontoya@hotmail.com', '46464865677', DATETIME('now'), DATETIME('now'));   	       
  	  SQL
  	)
  end

  def self.all 
  	Chef.db.execute(
  	  <<-SQL
  	    SELECT * FROM chefs;
  	  SQL
  	)  
  end

  def self.where(column, value)
  	Chef.db.execute(
  	  <<-SQL
  	    SELECT * FROM chefs WHERE #{column} = '#{value}';
  	  SQL
  	)
  end

   def self.save(a1, a2, a3, a4, a5)
  	Chef.db.execute(
  	  <<-SQL
  	    INSERT INTO chefs
  	      (firts_name, last_name, birthday, email, phone, created_at, update_at)
  	    VALUES
  	      ('#{a1}', '#{a2}', '#{a3}', '#{a4}', '#{a5}', DATETIME('now'), DATETIME('now'));    
  	  SQL
  	)
  end

  def self.erase(value)
    Chef.db.execute(
      <<-SQL
        DELETE FROM chefs WHERE id = '#{value}';
      SQL
    )
  end       	

  private
  
  def self.db
    @@db ||= SQLite3::Database.new("Chefs.db")
  end

end


 
