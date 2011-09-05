class UpdateCommentBodyToContent < ActiveRecord::Migration
  def up
		rename_column :comments, :body, :content
  end

  def down
		rename_column :comments, :content, :body
  end
end
