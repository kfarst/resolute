class ChangeCampRegistrationFieldToTournamentEntryField < ActiveRecord::Migration
  def self.up
    rename_column :items, :include_camp_registration_form, :include_tournament_entry_form, :default => false
  end

  def self.down
    rename_column :items, :include_tournament_entry_form, :include_camp_registration_form
  end
end
