class PoliciesController < ApplicationController
  def index
    @policies = Policy.all
  end

  def show
    @policy = Policy.find(params[:id])
  end

  def new
    @policy = Policy.new
  end

  def create
    @policy = Policy.new(params[:policy])
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
