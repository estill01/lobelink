class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :topic

      t.timestamps
    end
  end
end
