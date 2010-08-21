class AddCampRegistrationFormToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :camp_registration_form, :boolean, :default => false
  end

  def self.down
    remove_column :items, :camp_registration_form
  end
end
