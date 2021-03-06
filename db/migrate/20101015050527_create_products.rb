class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string   :name
      t.float    :price
      t.string   :size
      t.string   :picture_file_name
      t.string   :picture_content_type
      t.integer  :picture_file_size
      t.datetime :picture_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
