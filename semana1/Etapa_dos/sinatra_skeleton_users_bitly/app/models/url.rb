class Url < ActiveRecord::Base
belongs_to :user
validates :long_url, presence: true
validates :long_url,  format: {with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix , message: "Url Format not valid"}  
before_create :create_short_url

  def create_short_url
	self.short_url = "#{('a'..'z').to_a.shuffle[0,8].join}"
  end
end

