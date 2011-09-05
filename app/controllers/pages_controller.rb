class PagesController < ApplicationController
	skip_authorization_check

  def home
		@users = User.order("created_at desc").limit(10)
  end

end
