Feature: Managing Tournament Pages

  Background: Logged In
    Given I am a site administrator
    And I am logged in

  Scenario: Adding a Tournament Page
    Given I am on the url /admin
    When I click on "Manage Tournament Pages"
    And I click "New Tournament Page"
    And I fill in "Title" with "Tourney Page 1"
    And I fill in "Body" with "This is a test tournament page."
    And I press "Save"
    Then I should see "Tournament page successfuly saved."
    And I should see "Tourney Page 1" within "#title"
    And I should see "This is a test tournament page."
