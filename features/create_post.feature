Feature: SharePost
  Scenario: Share a rails best practices
    Given flyerhzm exists
    When I login as flyerhzm with password: "flyerhzm"
    And I follow "Submit"
    Then I should see "Share a Rails Best Practice"
    When I fill in the following:
      | Title              | first best practices           |
      | Short Description  | first short description        |
      | Tag list           | rails, test                    |
    And I fill in "Content" with "*italic* **bold**"
    And I press "Create"
    Then I should see "Best Practice was successfully created!"
    And I should see "first best practices" within "h2"
    And I should see "first short description" within ".description"
    And I should see "rails" within ".tags a"
    And I should see "test" within ".tags a"
    And I should see "italic" within ".wikistyle em"
    And I should see "bold" within ".wikistyle strong"
