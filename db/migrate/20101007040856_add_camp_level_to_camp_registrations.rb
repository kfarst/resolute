class AddCampLevelToCampRegistrations < ActiveRecord::Migration
  def self.up
    add_column :camp_registrations, :camp_level, :string
  end

  def self.down
    remove_column :camp_registrations, :camp_level
  end
end
