class AddConcernIdToPolicies < ActiveRecord::Migration
  def change
		add_column :policies, :concern_id, :integer
  end
end
