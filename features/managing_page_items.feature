Feature: managing page items

  Background: Logged In
    Given I am a site administrator
    And I am logged in

  Scenario: creating a page
    When I create a page titled "Test Page"
    And I assign it to the category "About Us"
    Then I should be on the root page

  Scenario: editing a page
    When I have a page titled "Test Page"
    And I change the page title to "Test Page 1"
    Then The category title should be "Test Page 1"

  Scenario: deleting a page
    When I have a page titled "Test Page"
    And I delete the page
    Then The page should be deleted
