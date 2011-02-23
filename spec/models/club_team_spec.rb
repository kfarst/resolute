require 'spec_helper'

describe ClubTeam do
  let(:club_team) { Factory.build(:club_team) }

  it "sets the slug before saving" do
    club_team.name = "Club Team 1"
    club_team.save!
    club_team.slug.should == "club-team-1"
  end

  context "with a position number" do
    it "saves it" do
      club_team.position = 7
      club_team.save!
      club_team.position.should == 1
    end
  end

  context "without a position number" do
    it "sets the position number to 0" do
      club_team.position = nil
      club_team.save!
      club_team.position.should == 1
    end
  end
end
