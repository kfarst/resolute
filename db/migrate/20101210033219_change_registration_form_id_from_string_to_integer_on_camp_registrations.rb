class ChangeRegistrationFormIdFromStringToIntegerOnCampRegistrations < ActiveRecord::Migration
  def self.up
    change_column :camp_registrations, :registration_form_id, :integer
  end

  def self.down
    change_column :camp_registrations, :registration_form_id, :string
  end
end
