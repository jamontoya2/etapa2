class CreateAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
  		t.string :answer_ok
  		t.string :answer_one
  		t.string :answer_two
  		t.string :answer_three
  		t.timestamps
  	end	  		 
  end
end
