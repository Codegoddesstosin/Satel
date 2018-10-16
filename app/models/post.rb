class Post < ApplicationRecord
	#relationship between posts and comments post has many comments
	has_many :comments, dependent: :delete_all

	# validation, required: presence true, as to be 5 characters
	validates :title, presence: true,
	                  length: {minimum: 5}
end
