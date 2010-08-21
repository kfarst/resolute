class AddColumnsToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :slug, :string, :null => false
    add_column :items, :camp_registration_form, :boolean, :default => false

    Item.transaction do
      Item.all.each do |i|
        i.slug = i.title.downcase.parameterize
        i.camp_registration_form = 0
        i.save
      end
    end
  end

  def self.down
    remove_column :items, :slug
    remove_column :items, :camp_registration_form
  end
end
