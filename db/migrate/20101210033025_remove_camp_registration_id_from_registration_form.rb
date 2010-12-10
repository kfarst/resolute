class RemoveCampRegistrationIdFromRegistrationForm < ActiveRecord::Migration
  def self.up
    remove_column :registration_forms, :camp_registration_id
  end

  def self.down
    add_column :registration_forms, :camp_registration_id
  end
end
