class AddTopicToPolicies < ActiveRecord::Migration
  def change
    add_column :policies, :topic, :string
  end
end
