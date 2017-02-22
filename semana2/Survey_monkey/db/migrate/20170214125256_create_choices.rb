class CreateChoices < ActiveRecord::Migration
  def change
  	create_table :choices do |t|
  		t.belongs_to :title, index: true
  		t.string :choice
  	end
  end
end
