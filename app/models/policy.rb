class Policy < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :as => :commentable

	extend FriendlyId
	friendly_id :issue, :use => :slugged

  attr_accessible :issue, :position, :explanation
end
