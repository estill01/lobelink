class Comment < ActiveRecord::Base
	belongs_to :commentable, :polymorphic => true, :counter_cache => true

  attr_accessible :body
end
