class CreateStaffMembers < ActiveRecord::Migration
  def self.up
    create_table :staff_members do |t|
      t.string   :name
      t.text     :stats
      t.text     :bio
      t.string   :profile_picture_file_name
      t.string   :profile_picture_content_type
      t.integer  :profile_picture_file_size
      t.datetime :profile_picture_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :staff_members
  end
end
