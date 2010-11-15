require 'spec_helper'

describe Camp do
  before(:each) do
    @camp = Camp.new :name => "Test Camp",
                     :start_at => Time.now,
                     :end_at => 3.days.from_now,
                     :description => "This is a test camp.",
                     :location => "123 Fake Street Columbus, OH 43210",
                     :group => "High School"
  end

  it "should not save the camp without a name" do
    @camp.name = ""
    @camp.save.should_not be_true, "camp saved without name"
  end

  it "should not save the camp without a start date" do
    @camp.start_at = ""
    @camp.save.should_not be_true, "camp saved without start date"
  end

  it "should not save the camp without a end date" do
    @camp.end_at = ""
    @camp.save.should_not be_true, "camp saved without end date"
  end

  it "should not save the camp without a description" do
    @camp.description = ""
    @camp.save.should_not be_true, "camp saved without description"
  end

  it "should not save the camp without a location" do
    @camp.location = ""
    @camp.save.should_not be_true, "camp saved without location"
  end

  it "should not save the camp without a group" do
    @camp.group = ""
    @camp.save.should_not be_true, "camp saved without group"
  end

  it "should not save the camp without a group" do
    @camp.payment_url = ""
    @camp.save.should_not be_true, "camp saved without payment URL"
  end
end

