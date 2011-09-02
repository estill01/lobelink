class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.string :objective
      t.string :explanation
      t.integer :policy_id
      t.timestamps
    end
  end

  def self.down
    drop_table :goals
  end
end
