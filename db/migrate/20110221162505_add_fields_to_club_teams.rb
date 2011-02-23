class AddFieldsToClubTeams < ActiveRecord::Migration
  def self.up
    add_column :club_teams, :parent_id, :integer
    add_column :club_teams, :position, :integer
  end


  def self.down
    remove_column :club_teams, :parent_id
    remove_column :club_teams, :position
  end
end
