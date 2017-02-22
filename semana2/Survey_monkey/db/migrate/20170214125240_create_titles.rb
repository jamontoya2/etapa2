class CreateTitles < ActiveRecord::Migration
  def change
  	create_table :titles do |t|
  		t.belongs_to :survey, index: true
  		t.string :title
 	end
  end
end
