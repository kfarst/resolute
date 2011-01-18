class CreateClubTeams < ActiveRecord::Migration
  def self.up
    create_table :club_teams do |t|
      t.string :name
      t.text :information
      t.string :slug

      t.timestamps
    end
  end

  def self.down
    drop_table :club_teams
  end
end
