require 'spec_helper'

describe TournamentPage do
  let(:tournament_page) { Factory.build(:tournament_page) }

  it "does not save without a title" do
    tournament_page.title = ""
    tournament_page.save.should_not be_true
  end

  it "does not save without a body" do
    tournament_page.body = ""
    tournament_page.save.should_not be_true
  end

  it "creates a slug from the title after saving" do
    tournament_page.save
    tournament_page.slug.should == "test-tournament-page"
  end
end
