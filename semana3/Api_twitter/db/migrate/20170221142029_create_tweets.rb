class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.belongs_to :user, index: true
  		t.string :text
  		t.timestamps 
  	end
  end
end
