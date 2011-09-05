class ConcernsController < ApplicationController
	respond_to :html, :json
	authorize_resource

	def index
		@concerns = Concern.find(:all)
	end

	def show
		@concern = Concern.find(params[:concern_id])
	end

	def new
		@concern = Concern.new
	end

	def create
		@concern = Concern.new(params[:concern])
		if current_user.logged_in?
			@concern.user_id = current_user.user_id
		else
			@concern.user_id = 0
		end

		if @concern.save
			redirect_to @concern, :notice => "Concern submitted."
		else
			render :action => 'new'
		end
	end

end
