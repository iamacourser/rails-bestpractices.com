Feature: Logout

  Background:
    Given I am already signed in as "flyerhzm"

  Scenario: Successful logout
    When I follow "Logout"
    Then I should see "Logout successful!"
    And I should see "Login"
