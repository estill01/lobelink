class DropGoals < ActiveRecord::Migration
  def up
		drop_table :goals	
  end

  def down
		create_table :goals do |t|
			t.string :target
			t.text :explanation
			t.integer :policy_id
			t.timestamps
		end
  end
end
