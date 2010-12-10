class ChangeRegistrationFormIdFromStringToIntegerOnCampRegistrations < ActiveRecord::Migration
  def self.up
    CampRegistration.transaction do
      rename_column :camp_registrations, :registration_form_id, :id_string
      add_column :camp_registrations, :registration_form_id, :integer

      say "Transferring data to new column..."

      CampRegistration.all.each do |camp_registration|
        camp_registration.registration_form_id = camp_registration.id_string.to_i
        camp_registration.save!
      end

      say "Done."

      remove_column :camp_registrations, :id_string
    end
  end

  def self.down
    CampRegistration.transaction do
      rename_column :camp_registrations, :registration_form_id, :id_integer
      add_column :camp_registrations, :registration_form_id, :string

      say "Transferring data to old column..."

      CampRegistration.all.each do |camp_registration|
        camp_registration.registration_form_id = camp_registration.id_integer.to_s
        camp_registration.save!
      end

      say "Done."

      remove_column :camp_registrations, :id_integer
    end
  end
end
