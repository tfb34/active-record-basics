class Post < ApplicationRecord
	validates(:link, presence: true, length: {maximum: 2048})
	belongs_to :user
end
