Feature: Managing Tournament Pages

  Background: Logged In
    Given I am a site administrator
    And I am logged in

  @javascript
  Scenario: Adding a Tournament Page
    Given I am on the admin page
    When I follow "Manage Tournament Pages"
    And I follow "New Tournament Page"
    And I fill in "Title" with "Tourney Page 1"
    And I fill in "textarea#tournament_page_body_editor.editor" with "This is a test tournament page." within "html.dj_gecko body div#container div#content form#edit_tournament_page_3.edit_tournament_page div.field"
    And I press "Save"
    Then I should see "Tournament page successfuly saved."
    And I should see "Tourney Page 1" within "#title"
    And I should see "This is a test tournament page."
