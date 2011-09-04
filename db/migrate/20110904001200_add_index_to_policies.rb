class AddIndexToPolicies < ActiveRecord::Migration
  def change
		add_index :policies, :user_id
  end
end
