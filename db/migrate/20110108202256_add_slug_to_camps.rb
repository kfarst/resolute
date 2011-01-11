class AddSlugToCamps < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.transaction do
      add_column :camps, :slug, :string

      Camp.all.each do |camp|
        camp.update_attributes!(:slug => camp.name.parameterize)
      end
    end
  end

  def self.down
    remove_column :camps, :slug
  end
end
