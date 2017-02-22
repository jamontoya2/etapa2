class User < ActiveRecord::Base
 has_many :rounds

	def self.authenticate(email, password)
    user = User.find_by(email: email)
      if user 
        user.password == password ? user : nil
      end
	end
end
