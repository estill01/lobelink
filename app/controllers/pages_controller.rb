class PagesController < ApplicationController
  def home
		@users = User.order("created_at desc").limit(10)
  end

end
