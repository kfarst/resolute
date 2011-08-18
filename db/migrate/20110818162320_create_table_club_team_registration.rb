class CreateTableClubTeamRegistration < ActiveRecord::Migration
  def self.up
    create_table :club_team_registrations do |t|
      t.string :first_name
      t.string :last_name
      t.string :school
      t.string :position
      t.string :primary_email
      t.string :secondary_email
      t.string :primary_phone
      t.string :secondary_phone
      t.integer :graduation_year
      t.integer :age
    end
  end

  def self.down
    drop_table :club_team_registrations
  end
end
