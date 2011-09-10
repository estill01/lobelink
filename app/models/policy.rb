class Policy < ActiveRecord::Base
	belongs_to :concern
	belongs_to :user, :counter_cache => true

	has_many :comments, :as => :commentable

	extend FriendlyId
	friendly_id :issue, :use => :slugged

  attr_accessible :issue, :position, :explanation

	validates :issue, :presence => true
	validates :position, :presence => true
	validates :explanation, :presence => true

	before_create :handle_anon
	after_save :anon_info	
	
	private
		# Policies are nested under Users so even anonymous users need a User object
#		def handle_anon
#			if @current_user.logged_in? == false
#				anon_user = User.new[:username => gen_anon.username, :email => gen_anon.email, :password => gen_anon.password]			
#				@current_user = User.find(anon_user.id)
#			else
#				return
#			end
#		end
#
#		# While anonymous, anon users will be differentiable 
#		def gen_anon
#			username = Proc.new { return SecureRandom.hex(9) }
#			email = Proc.new { return Faker::Internet.email }
#			password = Proc.new { return SecureRandom.hex(9) }
#
#			tmp_username = username
#			tmp_email = email
#			tmp_password = password
#		end
#		
#		def anon_info
#				flash[:notice => "Generated anonymous credentials: Username|#{gen_anon.tmp_username}, Password|#{gen_anon.tmp_password}, Email|#{gen_anon.temp_email}"]
#		end
end
