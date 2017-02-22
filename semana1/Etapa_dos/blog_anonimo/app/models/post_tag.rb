class Post_tag < ActiveRecord::Base
	belongs_to :posts
	belongs_to :tags  
end
