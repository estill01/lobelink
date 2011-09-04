class IssuesController < ApplicationController
	respond_to :html, :json

	def index
		@issues = Issue.find(:all)
	end

	def show
		@issue = Issue.find(params[:issue_id])
	end

	def new
		@issue = Issue.new
	end

	def create
		@issue = Issue.new(params[:issue])
		if current_user.logged_in?
			@issue.user_id = current_user.user_id
		else
			@issue.user_id = 0
		end

		if @issue.save
			redirect_to @issue, :notice => "Issue submitted for consideration."
		else
			render :action => 'new'
		end
	end

end
