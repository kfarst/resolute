class AddFieldsToClubTeamRegistrations < ActiveRecord::Migration
  def self.up
    add_column :club_team_registrations, :street_address, :string
    add_column :club_team_registrations, :city, :string
    add_column :club_team_registrations, :state, :string
    add_column :club_team_registrations, :zip, :integer
  end

  def self.down
    remove_column :club_team_registrations, :zip
    remove_column :club_team_registrations, :state
    remove_column :club_team_registrations, :city
    remove_column :club_team_registrations, :street_address
    remove_column :club_team_registrations, :zip
  end
end
