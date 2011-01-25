class ChangeFileFieldNamesInPanels < ActiveRecord::Migration
  def self.up
    rename_column :panels, :picture_file_name, :panel_file_name
    rename_column :panels, :picture_content_type, :panel_content_type
    rename_column :panels, :picture_file_size, :panel_file_size
    rename_column :panels, :picture_updated_at, :panel_updated_at
  end

  def self.down
    rename_column :panels, :panel_file_name, :picture_file_name
    rename_column :panels, :panel_content_type, :picture_content_type
    rename_column :panels, :panel_file_size, :picture_file_size
    rename_column :panels, :panel_updated_at, :picture_updated_at
  end
end
