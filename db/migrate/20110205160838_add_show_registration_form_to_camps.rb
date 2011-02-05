class AddShowRegistrationFormToCamps < ActiveRecord::Migration
  def self.up
    add_column :camps, :show_registration_form, :boolean, :default => true
  end

  def self.down
    remove_column :camps, :show_registration_form
  end
end
