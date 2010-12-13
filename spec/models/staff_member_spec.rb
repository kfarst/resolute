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

  describe "#stats_array" do
    let(:member) { Factory.build(:staff_member, :stats => "") }

    it "returns an array" do
      member.stats_array.should be_a(Array)
    end

    context "with data" do
      it "splits the member stats into individual stats" do
        member.stats_array.should == ["Stat 1", "Stat 2", "Stat 3"]
      end
    end

    context "without data" do
      it "returns an empty array" do
        member.stats_array.should == []
      end
    end
  end

  describe "#stats_csv" do
    let(:member) { Factory.build(:staff_member) }

    it "returns a string" do
      member.stats_csv.should be_a(String)
    end

    it "concatanates the member stats into comma separated values" do
      member.stats_csv.should == "Stat 1,Stat 2,Stat 3"
    end
  end
end
