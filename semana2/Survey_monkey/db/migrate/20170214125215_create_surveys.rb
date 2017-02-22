class CreateSurveys < ActiveRecord::Migration
  def change
  	create_table :surveys do |t|
  		t.belongs_to :user, index: true
  		t.string :survey
  	end
  end
end
