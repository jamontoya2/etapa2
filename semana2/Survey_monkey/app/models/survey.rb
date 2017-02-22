class Survey < ActiveRecord::Base
	belongs_to :user
	has_many :titles
end
