class AddCachedSlugToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cached_slug, :string
		add_index :users, :cached_slug, :unique => true
  end
end
