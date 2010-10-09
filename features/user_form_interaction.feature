Feature: User Form Interaction
  Background:
    Given I am a visitor


  Scenario: Creating a camp registration
    Given I am on the camp registration page
    When I fill out the camp registration form
    Then I will be signed up for the camp

  Scenario: Contacting the website
    Given I am on the Contact Us page
    When I fill out the contact us form
    Then it sends a message to the website

  Scenario: Signing up for the contest
    Given I am on the contest page
    When I fill out the contest form
    Then I will be signed up for the contest
