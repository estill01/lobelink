class Policy < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :as => :commentable

  attr_accessible :position, :explanation
end
