Feature: SearchPost
  Scenario: Search rails best practices
    Given flyerhzm exists
    And a code_post exists with user: the user
    When I go to the home page
    And I fill in "q" with "post"
    And I press "Search"
    Then I should see "code post" within ".posts .title"
