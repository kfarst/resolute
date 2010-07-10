class AddColumnsToContests < ActiveRecord::Migration
  def self.up
    add_column :contests, :age, :string
    add_column :contests, :school, :string
    add_column :contests, :position, :string
  end

  def self.down
    remove_column :contests, :position
    remove_column :contests, :school
    remove_column :contests, :age
  end
end
