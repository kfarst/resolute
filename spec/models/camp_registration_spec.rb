require 'spec_helper'

describe CampRegistrations do
  before(:each) do
    @contest = CampRegistrations.new(:name => "John Smith", :email => "john@example.com", 
                                :age => "22", :school => "James Woods High School",
                                :position => "Defense", :comments => "Hello World!", 
                                :phone => "5840384381")
  end

  it "should not save the camp registration without a name" do
    @contest.name = ""
    @contest.save.should_not be_true, "camp registration saved without name"
  end

  it "should not save the camp registration without an email" do
    @contest.email = ""
    @contest.save.should_not be_true, "camp registration saved without email"
  end

  it "should not save the camp registration without an age" do
    @contest.age = ""
    @contest.save.should_not be_true, "camp registration saved without age"
  end

  it "should not save the camp registration without a position" do
    @contest.position = ""
    @contest.save.should_not be_true, "camp registration saved without position"
  end

  it "should not save the camp registration without a school" do
    @contest.school = ""
    @contest.save.should_not be_true, "camp registration saved without school"
  end

  it "should not save the camp registration if the email address is not in the proper format" do
    @contest.email = "9h0(H#09"
    @contest.save.should_not be_true, "camp registration saved without proper email format"
  end

  it "should not save the camp registration if the email is not unique" do
    @contest.save.should be_true, "contest not saved"

    @contest = CampRegistrations.new(:name => "John Smith", :email => "john@example.com", 
                                :age => "22", :school => "James Woods High School",
                                :position => "Defense", :comments => "Hello World!", 
                                :phone => "5840384381")

    @clone_contest.save.should_not be_true, "camp registration saved with existing email address in database"
  end

  it "should not save the camp registration if age is greater than two numbers" do
    @contest.age = 100
    @contest.save.should_not be_true, "camp registration saved with age greater than 99"
  end

  it "should not save the camp registration if age is not a number" do
    @contest.age = "Test"
    @contest.save.should_not be_true, "camp registration saved with age not an integer"
  end

  it "should not save the camp registration without a phone number" do
    @contest.phone = ""
    @contest.save.should_not be_true, "camp registration saved without a phone number"
  end

  it "should not save the camp registration with a malformed phone number" do
    @contest.phone = "02jf092jf"
    @contest.save.should_not be_true, "camp registration saved with a malformed phone number"
  end

  it "should not save the camp registration with a phone number longer than 10 characters" do
    @contest.phone = "48304839203"
    @contest.save.should_not be_true, "camp registration saved with a phone number longer than 10 characters"
  end
end

