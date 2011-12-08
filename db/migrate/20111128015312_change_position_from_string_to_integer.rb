class ChangePositionFromStringToInteger < ActiveRecord::Migration
  def self.up
    change_column :panels, :position, :integer

    Panel.all.each_with_index do |panel, i|
      panel.update_attribute(:position, i)
    end
  end

  def self.down
    change_column :panels, :position, :string
  end
end
