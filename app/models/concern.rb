class Concern < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :as => :commentable
end
