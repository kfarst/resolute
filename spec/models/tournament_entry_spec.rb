require 'spec_helper'

describe TournamentEntry do
  before(:each) do
    @tournament_entry = Factory.build(:tournament_entry)
  end

  it "should not save the tournament entry without a team name" do
    @tournament_entry.team_name = ""
    @tournament_entry.save.should_not be_true, "tourteam_nament entry saved without team_name"
  end

  it "should not save the tournament entry without the coach's name" do
    @tournament_entry.coach_name = ""
    @tournament_entry.save.should_not be_true, "tourteam_nament entry saved without coach's name"
  end

  it "should not save the tournament entry without the coach's email" do
    @tournament_entry.coach_email = ""
    @tournament_entry.save.should_not be_true, "tournament entry saved without coach's email"
  end

  it "should not save the tournament entry without the coach's phone number" do
    @tournament_entry.coach_phone = ""
    @tournament_entry.save.should_not be_true, "tournament entry saved without coach's phone number"
  end

  it "should not save the tournament entry without the director's name" do
    @tournament_entry.director_name = ""
    @tournament_entry.save.should_not be_true, "tournament entry saved without director's name"
  end

  it "should not save the tournament entry without a division" do
    @tournament_entry.division = ""
    @tournament_entry.save.should_not be_true, "tournament entry saved without a division"
  end

  it "should not save the tournament entry without the director's street address" do
    @tournament_entry.street_address = ""
    @tournament_entry.save.should_not be_true, "tournament entry saved without director's street address"
  end

  it "should not save the tournament entry without the director's city" do
    @tournament_entry.city = ""
    @tournament_entry.save.should_not be_true, "tournament entry saved without director's city"
  end

  it "should not save the tournament entry without the director's state" do
    @tournament_entry.state = ""
    @tournament_entry.save.should_not be_true, "tournament entry saved without director's state"
  end

  it "should not save the tournament entry without the director's zip" do
    @tournament_entry.zip = ""
    @tournament_entry.save.should_not be_true, "tournament entry saved without director's zip"
  end

  it "should not save the tournament entry if the coach's email address is not in the proper format" do
    @tournament_entry.coach_email = "9h0(H#09"
    @tournament_entry.save.should_not be_true, "tournament entry saved without proper email format"
  end

  it "should not save the tournament entry if zip is not a number" do
    @tournament_entry.zip = "Test"
    @tournament_entry.save.should_not be_true, "tournament entry saved with zip not an integer"
  end
end
