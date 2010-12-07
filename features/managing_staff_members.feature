Feature: Managing products
  Background:
    Given I am a site administrator
    And I am logged in
    And I am on the staff member admin page

  Scenario: Adding a staff member
    When I fill out the new staff member form
    Then the staff member should be listed on the admin page
    And  the staff member should be listed on the staff members page
