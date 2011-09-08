class AddConcernsCountToUsers < ActiveRecord::Migration
  def change
		add_column :users, :concerns_count, :integer, :default => 0
  end
end
