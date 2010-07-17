Feature: Vote
  Scenario: Vote as like
    Given flyerhzm exists
    And a post exists with user: the user
    When I login as flyerhzm with password: "flyerhzm"
    And I follow "post"
    And I press "Like"
    Then I should see "1" within ".vote-info"
    And I should see "Like" within ".vote-info .like-icon"
  Scenario: Vote as unlike
    Given flyerhzm exists
    And a post exists with user: the user
    When I login as flyerhzm with password: "flyerhzm"
    And I follow "post"
    And I press "Unlike"
    Then I should see "-1" within ".vote-info"
    And I should see "Unlike" within ".vote-info .unlike-icon"