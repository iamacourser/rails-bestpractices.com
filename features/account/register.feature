Feature: Register Account

  Background:
    Given I am on the homepage
    And I follow "Register"

  Scenario: Successful registration with valid info
    Given I fill in the following:
      | Username              | flyerhzm           |
      | Email                 | flyerhzm@gmail.com |
      | Password              | flyerhzm           |
      | Password confirmation | flyerhzm           |
    When I press "Register"
    Then I should be on the home page
    And I should see success message "Register successful!"

  Scenario Outline: Unsuccessful registration with duplicated info
    Given a user exists with <db-field>: "<value>"
    And I fill in the following:
      | Username              | flyerhzm           |
      | Email                 | flyerhzm@gmail.com |
      | Password              | flyerhzm           |
      | Password confirmation | flyerhzm           |
    When I press "Register"
    Then I should be on register failure page
    And I should see error field "<field>"

    Examples:
      | db-field | value              | field    |
      | login    | flyerhzm           | Username |
      | email    | flyerhzm@gmail.com | Email    |

  Scenario: Unsuccessful registration with invalid info
    # We only cover a subset of the invalid info, cos the validity of registration
    # (creating of new user) is actually handled by Authlogic.
    Given I fill in the following:
      | Username              | |
      | Email                 | |
      | Password              | |
      | Password confirmation | |
    When I press "Register"
    Then I should be on register failure page
    And I should see error fields: "Username", "Email" & "Password"

  Scenario: Successful registration from post show page
    Given a post exists with title: "first best practice"
    And I go to the home page
    And I follow "first best practice"
    And I fill in the following:
      | user_login                 | flyerhzm           |
      | user_email                 | flyerhzm@gmail.com |
      | user_password              | flyerhzm           |
      | user_password_confirmation | flyerhzm           |
    When I press "Register"
    Then I should see "first best practice" page
    And I should see success message "Register successful!"
    And I should see "Logout"
