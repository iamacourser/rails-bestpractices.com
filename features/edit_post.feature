Feature: EditPost
  Scenario: Edit a rails best practice
    Given flyerhzm exists
    And a post exists with user: the user
    When I login as flyerhzm with password: "flyerhzm"
    And I follow "post"
    And I follow "Edit"
    And I fill in the following:
      | Title              | edit best practices           |
      | Short Description  | edit short description        |
      | Tag list           | edit, test                    |
      | Content            | *italic* **bold**             |
    And I press "Save"
    Then I should see "Best Practice was successfully updated!"
    And I should see "edit best practices" within "h2"
    And I should see "edit short description" within "p.description"
    And I should see "edit" within ".tags a"
    And I should see "test" within ".tags a"
    And I should see "italic" within ".wikistyle em"
    And I should see "bold" within ".wikistyle strong"
    
  Scenario: Other user can't see "Edit" a rails best practice
    Given flyerhzm exists
    And a post exists with user: the user
    And richard exists
    When I login as richard with password: "richard"
    And I follow "post"
    Then I should not see "Edit"