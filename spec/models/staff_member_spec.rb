require 'spec_helper'

describe StaffMember do
  before(:each) do
    @member = Factory.build(:staff_member)
  end

  it "validates the presence of name" do
    @member.name = ""
    @member.should_not be_valid
  end

  it "validates the presence of stats" do
    @member.stats = ""
    @member.should_not be_valid
  end

  it "validates the presence of bio" do
    @member.bio = ""
    @member.should_not be_valid
  end

  describe "#get_stats" do
    let(:member) { Factory.build(:staff_member) }

    it "returns an array" do
      member.get_stats.should be_a(Array)
    end

    it "splits the member stats into individual stats" do
      member.get_stats.should == ["Stat 1", "Stat 2", "Stat 3"]
    end
  end
end
