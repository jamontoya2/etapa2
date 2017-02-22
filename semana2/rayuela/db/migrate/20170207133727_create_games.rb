class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.string :winner
  		t.integer :player_uno
  		t.integer :player_dos
  		t.timestamps
  	end
  end
end
