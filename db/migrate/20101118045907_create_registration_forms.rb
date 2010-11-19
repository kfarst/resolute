class CreateRegistrationForms < ActiveRecord::Migration
  def self.up
    create_table :registration_forms do |t|
      t.boolean :name
      t.boolean :age
      t.boolean :school
      t.boolean :position
      t.boolean :email
      t.boolean :phone
      t.boolean :address
      t.boolean :grade
      t.boolean :yrs_of_exp
      t.boolean :finding_resolute
      t.boolean :comments
      t.integer :camp_registration_id
      t.integer :camp_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registration_forms
  end
end
