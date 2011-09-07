class ChangePoliciesCachedSlugToSlug < ActiveRecord::Migration
  def up
		rename_column :policies, :cached_slug, :slug
  end

  def down
		rename_column :policies, :slug, :cached_slug
  end
end
