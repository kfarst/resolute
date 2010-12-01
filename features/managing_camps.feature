Feature: Managing Camps

  Background: Logged In
    Given I am a site administrator
    And I am logged in
    And I have a camp with all fields required

  @javascript
  Scenario: Signing up for a camp
    When I register for the camp
    And I go to the camp registration admin page
    Then I will be signed up for the camp

  @javascript
  Scenario: Signing up for a camp with empty data
    When I register for the camp with empty data
    Then I will get an error message

  @javascript
  Scenario: Signing up for a camp bad
    When I register for the camp with bad data
    Then I will get an error message
