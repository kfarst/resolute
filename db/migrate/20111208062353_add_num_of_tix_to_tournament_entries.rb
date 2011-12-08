class AddNumOfTixToTournamentEntries < ActiveRecord::Migration
  def self.up
    add_column :tournament_entries, :num_of_tix, :integer
  end

  def self.down
    remove_column :tournament_entries, :num_of_tix
  end
end
