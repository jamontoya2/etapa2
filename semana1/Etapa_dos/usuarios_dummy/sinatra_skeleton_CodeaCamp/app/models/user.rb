class User < ActiveRecord::Base
validates :name, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Not Valid"}  
validates :password, presence: true

  
	def self.authenticate(email, password)
		user = User.find_by(email: email)
    if user 
    	user.password == password ? user : nil
  	end
  end
end