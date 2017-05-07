class Post < ApplicationRecord
	validates(:link, presence: true, length: {maximum: 2048})
	
end
