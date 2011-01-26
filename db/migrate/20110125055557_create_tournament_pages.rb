class CreateTournamentPages < ActiveRecord::Migration
  def self.up
    create_table :tournament_pages do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :tournament_pages
  end
end
