class AddColumnsToItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :camp_registration_form, :boolean, :default => false
    add_column :items, :slug, :string

    Item.transaction do
      Item.all.each{|i| i.slug = i.title.downcase.parameterize;i.camp_registration_form = false;i.save}
    end
  end

  def self.down
    add_column :items, :camp_registration_form, :boolean, :default => false
    remove_column :items, :slug
  end
end
