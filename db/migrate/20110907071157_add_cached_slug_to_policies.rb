class AddCachedSlugToPolicies < ActiveRecord::Migration
  def change
    add_column :policies, :cached_slug, :string
		add_index :policies, [:user_id, :cached_slug], :unique => true
  end
end
