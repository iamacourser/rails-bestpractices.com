Feature: Login

  Background:
    Given flyerhzm exists
    And I am on login page

  Scenario: Successful login with matching info
    Given I fill in the following:
      | Username | flyerhzm |
      | Password | flyerhzm |
    When I press "Login"
    Then I should be on the home page
    And I should see success message "Login successful!"
    And I should see "Logout"

  Scenario Outline: Unsuccessful login with empty info
    Given I fill in the following:
      | Username | <username> |
      | Password | <password> |
    When I press "Login"
    Then I should be on login failure page
    And I should see "<field>" with error "cannot be blank"

    Examples:
      | username | password | field    |
      |          | 1234     | Username |
      | flyerhzm |          | Password |

  Scenario Outline: Unsuccessful login with non-matching info
    Given I fill in the following:
      | Username | <username> |
      | Password | <password> |
    When I press "Login"
    Then I should be on login failure page
    And I should see "<field>" with error "is not valid"

    Examples:
      | username | password | field    |
      | flyerhzm | 1234     | Password |
      | awesome  | flyerhzm | Username |

