class CreateCoachClinicRegistrations < ActiveRecord::Migration
  def self.up
    create_table :coach_clinic_registrations do |t|
      t.string :name
      t.string :program
      t.string :email
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :coach_clinic_registrations
  end
end
