class CreatePolicies < ActiveRecord::Migration
  def self.up
    create_table :policies do |t|
      t.string :position
      t.string :explanation
      t.timestamps
    end
  end

  def self.down
    drop_table :policies
  end
end
