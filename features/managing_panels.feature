Feature: Managing Panels

  Background: Logging In
    Given I am a site administrator
    And I am logged in
    And I am on the panels admin page

    @javascript
    Scenario: Adding New Panels
      When I add three new panels
      Then they will be saved
      And they will show up on the homepage

    @javascript
    Scenario: Adding One New Panel
      When I add one new panel
      Then it will be saved
      And it will show up on the homepage
      And the existing panels will still be in place

    @javascript
    Scenario: Adding New Panels With Missing Information
      When I add one new panel with missing information
      Then I will receive errors

    @javascript
    Scenario: Adding One New Panel With Missing Information
      When I add new panels with missing information
      Then I will receive errors
