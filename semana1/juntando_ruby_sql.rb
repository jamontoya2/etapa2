requiere 'sqlite3'

class Chef
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
  	      update_at DATETIME NOT NULL,
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
  	      ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381093238', DATETIME('now'), DATETIME('now'));
  	  SQL
  	)
  end

  private

  def self.db
  	@@db ||= SQLlite::Database.new("chefs.db")
  end

 end