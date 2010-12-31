class CreateTournamentEntries < ActiveRecord::Migration
  def self.up
    create_table :tournament_entries do |t|
      t.string  :team_name
      t.string  :coach_name
      t.string  :coach_phone
      t.string  :coach_email
      t.string  :director_name
      t.string  :division
      t.string  :street_address
      t.string  :city
      t.string  :state
      t.integer :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :tournament_entries
  end
end
