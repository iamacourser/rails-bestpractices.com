Feature: PostComment
  Scenario: Post a comment without login
    Given flyerhzm exists
    And a post exists with user: the user
    When I go to the home page
    And I follow "post"
    And I fill in "Username" with "richard"
    And I fill in "comment_body" with "good post"
    And I press "Comment"
    Then I should see "Comment was successfully created"
    And I should see "good post" within ".comment"
    And I should see "richard" within ".comment"
    
  Scenario: Post a comment with logged in user
    Given flyerhzm exists
    And a post exists with user: the user
    And richard exists
    When I login as richard with password: "richard"
    And I follow "post"
    And I fill in "comment_body" with "good post"
    And I press "Comment"
    Then I should see "Comment was successfully created"
    And I should see "good post" within ".comment"
    And I should see "richard" within ".comment"