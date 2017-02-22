class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :comment
  		t.string :author
  		t.timestamps	
  	end
  end
end
