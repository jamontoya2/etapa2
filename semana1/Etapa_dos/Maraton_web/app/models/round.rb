class Round < ActiveRecord::Base
	has_many :round_decks 
    has_many :decks, through: :round_decks
	belongs_to :user
	#has_many :decks
	has_many :guesses
    has_many :answers, :through => :guesses
end
