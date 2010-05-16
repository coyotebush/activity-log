class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.datetime :start
      t.datetime :end
      t.float :distance
      t.string :type
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
