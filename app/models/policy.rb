class Policy < ActiveRecord::Base
	belongs_to :user
	belongs_to :issue

  attr_accessible :position, :explanation
end
