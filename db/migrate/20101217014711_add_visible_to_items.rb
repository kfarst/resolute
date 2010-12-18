class AddVisibleToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :visible, :boolean, :default => true
  end

  def self.down
    remove_column :items, :visible
  end
end
