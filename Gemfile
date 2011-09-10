source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'sqlite3-ruby', :require => 'sqlite3', :group => [:development, :test]
gem 'jquery-rails'
gem 'heroku'
gem 'taps'
gem 'thin'
gem 'nifty-generators'														# slightly souped up generators
gem 'gravtastic'																	# user gravatar.com avatars for new users
gem 'formtastic'																	# form builder abstraction
gem 'faker'																				# using to make temp username/password/email for anonymous users
gem 'carrierwave'																	# image handling/uploading
gem 'cancan'																			# restrict access based on user type. could be useful for non-signed in 'guest' users
gem 'friendly_id', "~> 4.0.0.beta8"								# descriptive urls, i.e., civisense.com/estill01 vs. civisense.com/users/
# gem 'inherited_resources'												# auto does controller logic for nested resources. also centralizes flash content in locales/

group :production do
	gem 'pg', :require => 'pg'
end



group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
	gem 'bourbon'
end

group :test do
  gem 'turn', :require => false
end
gem "mocha", :group => :test
