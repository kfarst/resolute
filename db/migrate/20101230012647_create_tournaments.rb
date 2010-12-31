class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.string :team_name
      t.string :coach_name
      t.string :coach_phone
      t.string :coach_email
      t.string :director_name
      t.string :division
      t.string :street_address
      t.string :city
      t.string :state
      t.number :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :tournaments
  end
end
