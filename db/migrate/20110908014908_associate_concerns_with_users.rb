class AssociateConcernsWithUsers < ActiveRecord::Migration
  def up
		add_column :concerns, :user_id, :integer
  end

  def down
		remove_column :concerns, :user_id, :integer
  end
end
