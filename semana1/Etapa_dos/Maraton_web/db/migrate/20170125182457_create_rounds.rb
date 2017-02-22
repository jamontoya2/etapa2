class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  	  t.belongs_to :user, index: true
      t.timestamps
  	end
  end
end
