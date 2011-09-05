class RenameIssuesToConcerns < ActiveRecord::Migration
  def up
		rename_table :issues, :concerns
  end

  def down
		rename_table :concerns, :issues
  end
end
