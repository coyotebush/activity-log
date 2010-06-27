class AddUserIdToActivities < ActiveRecord::Migration
  def self.up
    add_column :activities, :user_id, :integer, :null => false, :default => 1
  end

  def self.down
    remove_column :activities, :user_id
  end
end
