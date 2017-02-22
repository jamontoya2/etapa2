class Tag < ActiveRecord::Base
  has_many :pots_tags
  has_many :posts, through: :pots_tags
  validate :name, uniqueness => true
end
