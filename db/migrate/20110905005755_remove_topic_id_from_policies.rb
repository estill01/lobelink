class RemoveTopicIdFromPolicies < ActiveRecord::Migration
  def up
		remove_column :policies, :topic_id
  end

  def down
		add_column :policies, :topic_id, :integer
  end
end
