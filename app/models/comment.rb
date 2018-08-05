class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :likes, as: :likeable

	#returns true if user can like a post
	def user_can_like(user_id)
		# self makes an object of Post class and tells if a user with user_id: as passed in the function, has a like on this post(like.length == 1)
		if self.likes.where(user_id: user_id).length == 1
			return false
		end

		return true
	end


    # to display like/unlike link for a user
	def like_status_string(user_id)
		
		if self.user_can_like(user_id)
			return 'like'			
		end

		return 'unlike'
	end


end
