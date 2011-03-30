Feature: Tournament Entry Interaction
  Background: 
    Given I have a category with the tournament entry form on it

    Scenario: Tournament Entry With No Data
      Given I am a visitor
      When I sign up for the tournament with no data
      Then I should see "errors prohibited this tournament entry from being submitted:"
    Scenario: Tournament Entry With Bad Data
      Given I am a visitor
      When I sign up for the tournament with bad data
      Then I should see "errors prohibited this tournament entry from being submitted:"
    Scenario: Tournament Entry With Correct Data
      Given I am a visitor
      When I sign up for the tournament with correct data
      Then I should be entered into the tournament
    Scenario: Viewing Tournament Entries
      Given I am a site administrator
      And I am logged in
      And I have a tournament entry
      When I am on the tournament entry admin page
      Then I should see "Test Team"
      And I should see "John Smith"
