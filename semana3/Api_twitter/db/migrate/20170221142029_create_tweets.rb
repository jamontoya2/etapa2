class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.belongs_to :user, index: true
  		t.string :id_tweet
  		t.string :text
  		t.datetime :post_date
  		t.timestamps 
  	end
  end
end
