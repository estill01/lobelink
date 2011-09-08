class AddPoliciesCountToUsers < ActiveRecord::Migration
  def change
		add_column :users, :policies_count, :integer, :default => 0
  end
end
