class PoliciesController < ApplicationController
	respond_to :html, :json
	authorize_resource :user, :through => :policy
	authorize_resource :policy

  def index
    @policies = Policy.all
  end

 def new
		@user = current_user
		@policy = @user.policies.build
		respond_with(@policy)
  end

  def create
		@user = current_user
		@policy = @user.policies.build(params[:policy])
    if @policy.save
      redirect_to @user, :notice => "Successfully created policy."
    else
      redirect_to root_path, :error => "Something went wrong. Please try again."
    end
  end

  def edit
		@user = current_user
    @policy = @user.policies.find(params[:id])
  end

  def update
		@user = current_user
    @policy = @user.policies.find(params[:id])
    if @policy.update_attributes(params[:policy])
      redirect_to user_path(@user), :notice  => "Successfully updated policy."
    else
      render :action => 'edit'
    end
  end

  def show
		@user = User.find(params[:user_id])
    @policy = Policy.find(params[:id])
  end
 
  def destroy
		@user = current_user
    @policy = @user.policies.find(params[:id])
    @policy.destroy
    redirect_to user_path(current_user), :notice => "Successfully destroyed policy."
  end
end
