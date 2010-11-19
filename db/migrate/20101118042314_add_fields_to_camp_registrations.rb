class AddFieldsToCampRegistrations < ActiveRecord::Migration
  def self.up
    add_column :camp_registrations, :street_address, :string
    add_column :camp_registrations, :city, :string
    add_column :camp_registrations, :state, :string
    add_column :camp_registrations, :zip, :string
    add_column :camp_registrations, :grade, :integer
    add_column :camp_registrations, :yrs_of_exp, :integer
    add_column :camp_registrations, :finding_resolute, :string
    remove_column :camp_registrations, :camp_level
  end

  def self.down
    remove_column :camp_registrations, :finding_resolute
    remove_column :camp_registrations, :yrs_of_exp
    remove_column :camp_registrations, :grade
    remove_column :camp_registrations, :street_address
    remove_column :camp_registrations, :city
    remove_column :camp_registrations, :state
    remove_column :camp_registrations, :zip
    add_column :camp_registrations, :camp_level, :string
  end
end
