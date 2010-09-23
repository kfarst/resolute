class CreateResoluteTeamSignUps < ActiveRecord::Migration
  def self.up
    create_table :resolute_team_sign_ups do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :school
      t.string :position
      t.string :position

      t.timestamps
    end
  end

  def self.down
    drop_table :resolute_team_sign_ups
  end
end
