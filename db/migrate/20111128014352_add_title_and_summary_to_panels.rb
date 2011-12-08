class AddTitleAndSummaryToPanels < ActiveRecord::Migration
  def self.up
    add_column :panels, :summary, :text
  end

  def self.down
    remove_column :panels, :summary
  end
end
