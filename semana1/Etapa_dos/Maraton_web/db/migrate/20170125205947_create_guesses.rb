class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|		
  		t.belongs_to :round, index: true
  		t.belongs_to :answer, index: true
  		t.integer :tries_good
  		t.integer :tries_fail 
  		t.string :result
  		t.timestamps
  	end	
  end
end
