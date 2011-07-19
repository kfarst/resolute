class AddGeneralPageToClubTeams < ActiveRecord::Migration
  def self.up
    add_column :club_teams, :general_page, :boolean, :default => false

    ClubTeam.all.each do |c|
      c.update_attribute(:general_page, false)
    end
  end

  def self.down
    remove_column :club_teams, :general_page
  end
end 
