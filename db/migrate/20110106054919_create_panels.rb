class CreatePanels < ActiveRecord::Migration
  def self.up
    create_table :panels do |t|
      t.string :title
      t.string :position
      t.string  :url
      t.string :picture_file_name
      t.string :picture_content_type
      t.string :picture_file_size
      t.datetime :picture_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :panels
  end
end
