class Deck < ActiveRecord::Base
	has_many :round_decks
    has_many :rounds, through: :round_decks
    #belongs_to :round
	has_many :cards
end
