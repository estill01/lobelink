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
end
