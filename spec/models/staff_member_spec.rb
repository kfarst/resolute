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
end
