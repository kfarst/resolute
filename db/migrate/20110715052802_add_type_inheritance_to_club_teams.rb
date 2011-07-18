class AddTypeInheritanceToClubTeams < ActiveRecord::Migration
  def self.up
    add_column :club_teams, :type_inheritance, :string

    ClubTeam.all.each do |c|
      c.update_attribute(:type_inheritance, "ClubTeamIndividual")
    end
  end

  def self.down
    remove_column :club_teams, :type_inheritance
  end
end
