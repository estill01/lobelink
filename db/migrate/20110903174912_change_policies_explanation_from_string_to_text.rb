class ChangePoliciesExplanationFromStringToText < ActiveRecord::Migration
  def up
		change_column :policies, :explanation, :string, :text
  end

  def down
		change_column :policies, :explanation, :text, :string
  end
end
