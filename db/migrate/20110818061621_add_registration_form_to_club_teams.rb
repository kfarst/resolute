class AddRegistrationFormToClubTeams < ActiveRecord::Migration
  def self.up
    add_column :club_teams, :show_registration_form, :boolean
  end

  def self.down
    remove_column :club_teams, :show_registration_form
  end
end
