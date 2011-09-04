class Issue < ActiveRecord::Base
	belongs_to :user
	has_many :policies
end
