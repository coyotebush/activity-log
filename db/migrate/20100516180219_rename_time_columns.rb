class RenameTimeColumns < ActiveRecord::Migration
  def self.up
    rename_column :activities, :start, :start_time
    rename_column :activities, :end, :end_time
  end

  def self.down
    rename_column :activities, :start_time, :start
    rename_column :activities, :end_time, :end
  end
end
