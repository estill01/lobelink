class Concern < ActiveRecord::Base
	belongs_to :user, :counter_cache => true
	has_many :comments, :as => :commentable
end
