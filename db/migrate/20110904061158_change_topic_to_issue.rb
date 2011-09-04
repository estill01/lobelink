class ChangeTopicToIssue < ActiveRecord::Migration
  def up
		rename_column(:policies, :topic, :issue)
  end

  def down
		rename_column(:policies, :issue, :topic)
  end
end
