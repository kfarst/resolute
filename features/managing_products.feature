Feature: Managing products
  Background: 
    Given I am a site administrator
    And I am logged in
    And I am on the product management admin page

  Scenario: Adding a product
    When I fill out the new product form with sizes
    And I go to the store page
    Then the product should be listed
    And  the product should have a sizes select menu

  Scenario: Adding a product without sizes
    When I fill out the new product form without sizes
    And I go to the store page
    Then the product should be listed
    And  the product should not have a sizes select menu
