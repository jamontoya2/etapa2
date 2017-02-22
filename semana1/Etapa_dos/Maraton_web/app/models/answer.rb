class Answer < ActiveRecord::Base
	belongs_to :card
    has_many :guesses
end
