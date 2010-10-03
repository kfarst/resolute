Feature: managing category items

  Background: Logged In
    Given I am a site administrator
    And I am logged in

  Scenario: creating a category
    When I create a category titled "Test Category"
    Then show me the page
    Then I should be on the root page

  Scenario: editing a category
    When I have a category titled "Test Category"
    And I change the category title to "Test Category 1"
    Then The category title should be "Test Category 1"

  Scenario: deleting a category
    When I have a category titled "Test Category"
    And I delete the category
    Then The category should be deleted
    And All pages belonging to the category should be deleted
