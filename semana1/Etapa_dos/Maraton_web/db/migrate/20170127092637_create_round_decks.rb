class CreateRoundDecks < ActiveRecord::Migration
  def change
  	create_table :round_decks do |t|
  	 t.belongs_to :round, index: true
  	 t.belongs_to :deck, index: true
  	end
  end
end
