class AddShirtSizeAndGenderToRegistrationForms < ActiveRecord::Migration
  def self.up
    add_column :registration_forms, :shirt_size, :boolean, :default => false
    add_column :registration_forms, :gender, :boolean, :default => false
  end

  def self.down
    remove_column :registration_forms, :gender
    remove_column :registration_forms, :shirt_size
  end
end
