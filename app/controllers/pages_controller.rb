class PagesController < ApplicationController
	skip_authorization_check

  def home
		@user = current_user
		@policy = Policy.new
  end

end
