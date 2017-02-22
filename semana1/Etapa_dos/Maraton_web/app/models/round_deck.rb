class RoundDeck < ActiveRecord::Base
	belongs_to :round
	belongs_to :deck
end
