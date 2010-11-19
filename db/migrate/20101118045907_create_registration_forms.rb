class CreateRegistrationForms < ActiveRecord::Migration
  def self.up
    create_table :registration_forms do |t|
      t.boolean :name, :default => false
      t.boolean :age, :default => false
      t.boolean :school, :default => false
      t.boolean :position, :default => false
      t.boolean :email, :default => false
      t.boolean :phone, :default => false
      t.boolean :address, :default => false
      t.boolean :grade, :default => false
      t.boolean :yrs_of_exp, :default => false
      t.boolean :finding_resolute, :default => false
      t.boolean :comments, :default => false
      t.integer :camp_registration_id
      t.integer :camp_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registration_forms
  end
end
