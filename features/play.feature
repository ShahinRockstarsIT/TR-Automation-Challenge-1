@start_playing

Feature: User Authentication

  # Invalid Login
  Scenario: go to the website and start playing
    Given I visit "https://orteil.dashnet.org/cookieclicker/"
    And I click on the "English" language
    When The website is loaded
    Then I start playing
