class PagesController < ApplicationController
	skip_authorization_check

  def home
		@users = User.order("created_at desc")

  end

end
