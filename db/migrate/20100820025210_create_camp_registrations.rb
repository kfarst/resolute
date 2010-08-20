class CreateCampRegistrations < ActiveRecord::Migration
  def self.up
    create_table :camp_registrations do |t|
      t.string :name
      t.integer :age
      t.string :position
      t.string :email
      t.string :phone
      t.string :school
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :camp_registrations
  end
end
