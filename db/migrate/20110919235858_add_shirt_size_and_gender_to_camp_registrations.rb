class AddShirtSizeAndGenderToCampRegistrations < ActiveRecord::Migration
  def self.up
    add_column :camp_registrations, :shirt_size, :string
    add_column :camp_registrations, :gender, :string
  end

  def self.down
    remove_column :camp_registrations, :gender
    remove_column :camp_registrations, :shirt_size
  end
end
