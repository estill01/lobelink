class PoliciesController < ApplicationController
	respond_to :html, :json

  def index
    @policies = Policy.all
  end

  def show
    @policy = Policy.find(params[:id])
  end

  def new
		@user = User.find(params[:user_id])
		@policy = @user.policies.build
		respond_with(@policy)
  end

  def create
		@user = User.find(params[:user_id])
		@policy = @user.policies.build(params[:policy])
    if @policy.save
      redirect_to @policy, :notice => "Successfully created policy."
    else
      render :action => 'new'
    end
  end

  def edit
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
