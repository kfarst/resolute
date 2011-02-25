require 'spec_helper'

describe ClubTeam do
  let(:club_team) { Factory.build(:club_team) }

  it "sets the slug before saving" do
    club_team.name = "Club Team 1"
    club_team.save!
    club_team.slug.should == "club-team-1"
  end
end
