class ChangePoliciesExplanationFromStringToText < ActiveRecord::Migration
  def up
		change_column :policies, :explanation, :text
  end

  def down
		change_column :policies, :explanation, :string
  end
end
