class CreateContestEntries < ActiveRecord::Migration
  def self.up
    create_table :contests do |t|
      t.string :name
      t.string :email, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :contests
  end
end
