require 'spec_helper'

describe CampRegistrations do
  before(:each) do
    @camp_registration = Factory.build(:camp_registration)
  end
  
  context "with all fields shown" do
    it "should not save the camp registration without a name" do
      @camp_registration.name = ""
      @camp_registration.save.should_not be_true, "camp registration saved without name"
    end

    it "should not save the camp registration without an email" do
      @camp_registration.email = ""
      @camp_registration.save.should_not be_true, "camp registration saved without email"
    end

    it "should not save the camp registration without an age" do
      @camp_registration.age = ""
      @camp_registration.save.should_not be_true, "camp registration saved without age"
    end

    it "should not save the camp registration without a position" do
      @camp_registration.position = ""
      @camp_registration.save.should_not be_true, "camp registration saved without position"
    end

    it "should not save the camp registration without a school" do
      @camp_registration.school = ""
      @camp_registration.save.should_not be_true, "camp registration saved without school"
    end

    it "should not save the camp registration if the email address is not in the proper format" do
      @camp_registration.email = "9h0(H#09"
      @camp_registration.save.should_not be_true, "camp registration saved without proper email format"
    end

    it "should not save the camp registration if age is greater than two numbers" do
      @camp_registration.age = 100
      @camp_registration.save.should_not be_true, "camp registration saved with age greater than 99"
    end

    it "should not save the camp registration if age is not a number" do
      @camp_registration.age = "Test"
      @camp_registration.save.should_not be_true, "camp registration saved with age not an integer"
    end

    it "should not save the camp registration without a phone number" do
      @camp_registration.phone = ""
      @camp_registration.save.should_not be_true, "camp registration saved without a phone number"
    end

    it "should not save the camp registration with a malformed phone number" do
      @camp_registration.phone = "02jf092jf"
      @camp_registration.save.should_not be_true, "camp registration saved with a malformed phone number"
    end

    it "should not save the camp registration with a phone number longer than 10 characters" do
      @camp_registration.phone = "48304839203"
      @camp_registration.save.should_not be_true, "camp registration saved with a phone number longer than 10 characters"
    end

    it "should not save the camp registration without a camp level" do
      @camp_registration.camp_level = ""
      @camp_registration.save.should_not be_true, "camp registration saved with a phone number longer than 10 characters"
    end

    it"should not save the camp registration without a street address" do
      @camp_registration.street_address = "" 
      @camp_registration.save.should_not be_true, "camp registration saved without a street address"
    end

    it"should not save the camp registration without a city" do
      @camp_registration.city = ""
      @camp_registration.save.should_not be_true, "camp registration saved without a city"
    end

    it"should not save the camp registration without a state" do
      @camp_registration.state = ""
      @camp_registration.save.should_not be_true, "camp registration saved without a state"
    end

    it"should not save the camp registration without a zip code" do
      @camp_registration.zip = ""
      @camp_registration.save.should_not be_true, "camp registration saved without a zip code"
    end

    it"should not save the camp registration without a grade" do
      @camp_registration.grade = ""
      @camp_registration.save.should_not be_true, "camp registration saved without a grade"
    end

    it"should not save the camp registration without years of experience indicated" do
      @camp_registration.yrs_of_exp = ""
      @camp_registration.save.should_not be_true, "camp registration saved without years of experience indicated"
    end
    
    it"should not save the camp registration without an explanation of how they found the company" do
      @camp_registration.finding_resolute = ""
      @camp_registration.save.should_not be_true, "camp registration saved without an explanation of how they found the company"
    end
  end

end
