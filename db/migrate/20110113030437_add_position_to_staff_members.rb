class AddPositionToStaffMembers < ActiveRecord::Migration
  def self.up
    add_column :staff_members, :position, :integer
  end

  def self.down
    remove_column :staff_members, :position
  end
end
