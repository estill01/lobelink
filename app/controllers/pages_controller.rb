class PagesController < ApplicationController
	skip_authorization_check

  def home
		@users = User
		@user = current_user
  end

end
