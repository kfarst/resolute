require 'test_helper'

class ContestTest < ActiveSupport::TestCase
  def setup
    @contest = Contest.new(:name => "John Smith", :email => "john@example.com", 
                          :age => "22", :school => "James Woods High School",
                          :position => "Defense")
  end

  test "should not save the contest entry without a name" do
    @contest.name = ""
    assert !@contest.save, "contest entry saved without name"
  end

  test "should not save the contest entry without an email" do
    @contest.email = ""
    assert !@contest.save, "contest entry saved without email"
  end

  test "should not save the contest entry without an age" do
    @contest.age = ""
    assert !@contest.save, "contest entry saved without age"
  end

  test "should not save the contest entry without a position" do
    @contest.position = ""
    assert !@contest.save, "contest entry saved without position"
  end

  test "should not save the contest entry without a school" do
    @contest.school = ""
    assert !@contest.save, "contest entry saved without school"
  end

  test "should not save the contest entry if the email address is not in the proper format" do
    @contest.email = "9h0(H#09"
    assert !@contest.save, "contest entry saved without proper email format"
  end

  test "should not save the contest entry if the email is not unique" do
    assert @contest.save, "contest not saved"

    @clone_contest = Contest.new(:name => "John Smith", :email => "john@example.com", 
                                :age => "22", :school => "James Woods High School",
                                :position => "Defense")

    assert !@clone_contest.save, "contest entry saved with existing email address in database"
  end

  test "should not save the contest entry if age is greater than two numbers" do
    @contest.age = 100
    assert !@contest.save, "contest entry saved with age greater than 99"
  end

  test "should not save the contest entry if age is not a number" do
    @contest.age = "Test"
    assert !@contest.save, "contest entry saved with age not an integer"
  end

end
