class AddTopicIdToPolicy < ActiveRecord::Migration
  def change
		add_column :policies, :topic_id, :integer
  end
end
