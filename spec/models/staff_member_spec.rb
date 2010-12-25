require 'spec_helper'

describe StaffMember do
  before(:each) do
    @member = Factory.build(:staff_member)
  end

  it "validates the presence of name" do
    @member.name = ""
    @member.should_not be_valid
  end


  it "validates the presence of bio" do
    @member.bio = ""
    @member.should_not be_valid
  end

  context "with stats" do
    before(:each) do
      @member.save
      @member.stats << Factory(:stat)
      @member.stats << Factory(:stat)
    end

    it "has stats" do
      @member.stats.should_not be_empty
    end

    it "returns an array of stats" do
      @member.stats.should be_a(Array)
    end
  end

end
