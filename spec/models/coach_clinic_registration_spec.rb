require 'spec_helper'

describe CoachClinicRegistration do
  before(:each) do
      @registration = CoachClinicRegistration.new(:name => "john smith", :email => "john@example.com", 
                                  :program => "james woods high school",
                                  :comments => "hello world!")
    end

    it "should not save the camp registration without a name" do
      @registration.name = ""
      @registration.save.should_not be_true, "camp registration saved without name"
    end

    it "should not save the camp registration without an email" do
      @registration.email = ""
      @registration.save.should_not be_true, "camp registration saved without email"
    end

    it "should not save the camp registration without a school" do
      @registration.program = ""
      @registration.save.should_not be_true, "camp registration saved without school"
    end

    it "should not save the camp registration if the email address is not in the proper format" do
      @registration.email = "9h0(h#09"
      @registration.save.should_not be_true, "camp registration saved without proper email format"
    end

    it "should not save the camp registration if the email is not unique" do
      @registration.save.should be_true, "contest not saved"

      @clone_registration = CoachClinicRegistration.new(:name => "john smith", :email => "john@example.com", 
                                  :program => "james woods high school",
                                  :comments => "hello world!")

      @clone_registration.save.should_not be_true, "camp registration saved with existing email address in database"
    end
end
