# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
#   <% if logged_in? %>
#     Welcome <%= current_user.username %>.
#     <%= link_to "Edit profile", edit_current_user_path %> or
#     <%= link_to "Log out", logout_path %>
#   <% else %>
#     <%= link_to "Sign up", signup_path %> or
#     <%= link_to "log in", login_path %>.
#   <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
#   before_filter :login_required, :except => [:index, :show]
module ControllerAuthentication
  def self.included(controller)
    controller.send :helper_method, :current_user, :logged_in?, :redirect_to_target_or_default
  end

  def current_user
		if session[:user_id]
	    @current_user ||= User.find(session[:user_id]) 
		else		# enabling anonymous users
############################################################################ this is the problem area
			anon_user = User.new
			anon_user.username = "#{gen_anon(username)}"
			anon_user.email = "#{gen_anon(email)}"
			anon_user.password = "#{gen_anon(password)}"
			anon_user.anon = true
		#	anon_info	# notify user of their temp credentials
			@current_user = User.find(anon_user.id)
		end
  end

  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      store_target_location
      redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
    end
  end

  def redirect_to_target_or_default(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end

	def gen_anon(arg)
		case arg
		when "email"
			return Faker::Internet.email 
		else
			return SecureRandom.hex(4)
		end
	end
	
	# courtesy method for anonymous users so they can sign back in 
	def anon_info
			flash[:notice => "Generated anonymous credentials: Username|#{gen_anon.tmp_username}, Password|#{gen_anon.tmp_password}, Email|#{gen_anon.temp_email}"]
	end
	
  private
  def store_target_location
    session[:return_to] = request.url
  end
end
