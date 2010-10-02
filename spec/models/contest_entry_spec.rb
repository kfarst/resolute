require 'spec_helper'

describe ContestEntry do
  before(:each) do
    @contest = ContestEntry.new(:name => "John Smith", :email => "john@example.com", 
                          :age => "22", :school => "James Woods High School",
                          :position => "Defense")
  end

  it "should not save the contest entry without a name" do
    @contest.name = ""
    @contest.save.should_not be_true, "contest entry saved without name"
  end

  it "should not save the contest entry without an email" do
    @contest.email = ""
    @contest.save.should_not be_true, "contest entry saved without email"
  end

  it "should not save the contest entry without an age" do
    @contest.age = ""
    @contest.save.should_not be_true, "contest entry saved without age"
  end

  it "should not save the contest entry without a position" do
    @contest.position = ""
    @contest.save.should_not be_true, "contest entry saved without position"
  end

  it "should not save the contest entry without a school" do
    @contest.school = ""
    @contest.save.should_not be_true, "contest entry saved without school"
  end

  it "should not save the contest entry if the email address is not in the proper format" do
    @contest.email = "9h0(H#09"
    @contest.save.should_not be_true, "contest entry saved without proper email format"
  end

  it "should not save the contest entry if the email is not unique" do
    assert @contest.save, "contest not saved"

    @clone_contest = ContestEntry.new(:name => "John Smith", :email => "john@example.com", 
                                :age => "22", :school => "James Woods High School",
                                :position => "Defense")

    assert !@clone_contest.save, "contest entry saved with existing email address in database"
  end

  it "should not save the contest entry if age is greater than two numbers" do
    @contest.age = 100
    @contest.save.should_not be_true, "contest entry saved with age greater than 99"
  end

  it "should not save the contest entry if age is not a number" do
    @contest.age = "Test"
    @contest.save.should_not be_true, "contest entry saved with age not an integer"
  end
end
