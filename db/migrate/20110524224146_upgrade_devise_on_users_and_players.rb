class UpgradeDeviseOnUsersAndPlayers < ActiveRecord::Migration
  def self.up
    remove_column :users, :password_salt
    remove_column :players, :password_salt
  end

  def self.down
    add_column :users, :password_salt, :string
    add_column :players, :password_salt, :string
  end
end
