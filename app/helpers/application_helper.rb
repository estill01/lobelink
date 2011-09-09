module ApplicationHelper
	def featured_user 
		featured = Policy.find(:first, :order => "created_at DESC")
		return User.find(featured.user_id)
	end
end
