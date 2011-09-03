class Policy < ActiveRecord::Base
	belongs_to :user

  attr_accessible :position, :explanation
end
