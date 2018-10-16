class Comment < ApplicationRecord
	#relationship between comments and posts
  belongs_to :post
end
