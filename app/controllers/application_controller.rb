class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
#	check_authorization 
	rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = "Access denied. Looks like you're not allowed to do that." 
		redirect_to root_path
	end
end
