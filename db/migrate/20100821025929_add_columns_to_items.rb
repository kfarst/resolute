class AddColumnsToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :slug, :string
    add_column :items, :camp_registration_form, :boolean, :default => 0

    Item.transaction do
      Item.all.each{|i| i.slug = i.title.downcase.parameterize;i.camp_registration_form = 0;i.save}
    end
  end

  def self.down
    remove_column :items, :slug
    remove_column :items, :camp_registration_form
  end
end
