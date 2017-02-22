class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags
  validates :name, uniqueness: true
  validates :name, presence: true
  



  def self.verificate(tag)
    Tag.find_by(name: tag)
  end



end
