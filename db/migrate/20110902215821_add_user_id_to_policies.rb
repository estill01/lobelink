class AddUserIdToPolicies < ActiveRecord::Migration
  def change
    add_column :policies, :user_id, :integer
  end
end
