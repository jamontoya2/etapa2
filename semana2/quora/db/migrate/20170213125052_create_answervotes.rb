class CreateAnswervotes < ActiveRecord::Migration
  def change
  	create_table :answervotes do |t|
  		t.belongs_to :answer, index: true
  		t.boolean :vote
  	end
  end
end
