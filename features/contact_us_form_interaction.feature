Feature: Contacting the Website
  Background:
    Given I am a visitor

  Scenario: Sending a message
    Given I am on the Contact Us page
    When I fill out the contact us form
    Then it sends a message to the website

  Scenario: Sending a message with bad data
    Given I am on the Contact Us page
    When I fill out the contact us form with bad data
    Then it displays error messages

  Scenario: Sending a message with missing data
    Given I am on the Contact Us page
    When I fill out the contact us form with missing data
    Then it displays error messages
