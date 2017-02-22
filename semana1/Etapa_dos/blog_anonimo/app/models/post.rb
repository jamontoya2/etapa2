class Post < ActiveRecord::Base
  has_many :pots_tags 
  has_many :tags, through: :pots_tags
  validates :body, presence => true
  validates :title, presence => true
end
