require 'spec_helper'

describe Camp do
  before(:each) do
    @camp = Factory.build(:camp)
  end

  it "should have valid attributes" do
    @camp.should be_valid
  end

  it "should save with valid attributes" do
    @camp.save.should be_true
  end

  it "should not save without a name" do
    @camp.name = ""
    @camp.save.should_not be_true, "camp saved without name"
  end

  it "should not save if a camp already has an identical name" do
    @camp.save!
    camp_copy = @camp.dup
    camp_copy.save.should_not be_true, "camp saved with identical name"
  end

  it "should not save without a start date" do
    @camp.start_at = ""
    @camp.save.should_not be_true, "camp saved without start date"
  end

  it "should not save without a end date" do
    @camp.end_at = ""
    @camp.save.should_not be_true, "camp saved without end date"
  end

  it "should not save without a description" do
    @camp.description = ""
    @camp.save.should_not be_true, "camp saved without description"
  end

  it "should not save without a location" do
    @camp.location = ""
    @camp.save.should_not be_true, "camp saved without location"
  end

  it "should not save without a group" do
    @camp.group = ""
    @camp.save.should_not be_true, "camp saved without group"
  end

  it "should not save without a cost" do
    @camp.cost = ""
    @camp.save.should_not be_true, "camp saved without cost"
  end

  it "should not save with a non-numeric cost" do
    @camp.cost = "adkjf"
    @camp.save.should_not be_true, "camp saved with non-numeric cost"
  end

  it "should not save with a malformed payment url" do
    @camp.payment_url = "aasdadsfsafdkjf"
    @camp.save.should_not be_true, "camp saved with malformed payment url"
  end

  it "should not save with a malformed address" do
    @camp.location = "aasdadsfsafdkjf"
    @camp.save.should_not be_true, "camp saved with malformed address"
  end

  describe "#get_address" do
    it "calls a get request on the Geocoding class" do
      Geocoding.should_receive(:get).with(@camp.location)
      @camp.get_address
    end
  end

  describe "#get_map" do
    it "returns a map image URL" do
      @camp.get_map.should be_a(String)
    end
  end
end
