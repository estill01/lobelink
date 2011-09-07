class ChangeUsersCachedSlugToSlug < ActiveRecord::Migration
  def up
		rename_column :users, :cached_slug, :slug
  end

  def down
		rename_column :users, :slug, :cached_slug
  end
end
