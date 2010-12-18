class RemoveStatsFromStaffMembers < ActiveRecord::Migration
  def self.up
    StaffMember.transaction do
      StaffMember.all.each do |member|
         Stat.create!(:stat => member.stats, :staff_member_id => member.id) 
      end

      remove_column :staff_members, :stats
    end
  end

  def self.down
    add_column :staff_members, :stats, :string
  end
end
