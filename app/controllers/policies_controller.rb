class PoliciesController < ApplicationController
	respond_to :html, :json
	authorize_resource :user, :through => :policy
	authorize_resource :policy

  def index
    @policies = Policy.all
  end

  def show
    @policy = Policy.find(params[:id])
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
    @policy = Policy.find(params[:id])
  end

  def update
    @policy = Policy.find(params[:id])
    if @policy.update_attributes(params[:policy])
      redirect_to @policy, :notice  => "Successfully updated policy."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @policy = Policy.find(params[:id])
    @policy.destroy
    redirect_to policies_url, :notice => "Successfully destroyed policy."
  end
end
