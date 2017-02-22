class CreateQuestionvotes < ActiveRecord::Migration
  def change
  	create_table :questionvotes do |t|
  		t.belongs_to :question, index: true
  		t.boolean :vote
  	end
  end
end
