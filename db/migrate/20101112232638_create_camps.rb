class CreateCamps < ActiveRecord::Migration
  def self.up
    create_table :camps do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.text :description
      t.string :location
      t.string :group
      t.decimal :cost
      t.string :payment_url

      t.timestamps
    end
  end

  def self.down
    drop_table :camps
  end
end
