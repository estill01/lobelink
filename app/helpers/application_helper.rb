module ApplicationHelper
	def featured_user 
		featured = Policy.find(:first, :order => "created_at DESC")
		return User.find(featured.user_id)
	end

	def newest_policies
		newest = Policy.find(:all, :order => "created_at DESC", :limit => 2)
		@newest = []
		newest.each do |policy|
			@newest << User.find(policy.user_id)
		end
		return @newest
	end
end
