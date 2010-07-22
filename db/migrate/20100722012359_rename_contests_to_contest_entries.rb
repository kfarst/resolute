class RenameContestsToContestEntries < ActiveRecord::Migration
  def self.up
    rename_table :contests, :contest_entries
  end

  def self.down
    rename_table :contest_entriee, :contests
  end
end
