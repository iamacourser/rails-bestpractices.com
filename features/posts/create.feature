Feature: Share Post

  Background:
    Given I am already signed in as "flyerhzm"
    And I follow "Share"

  Scenario: Accessing create post page
    Then I should see "Share a Rails Best Practice" page

  Scenario: Successful create with valid info
    Given I fill in the following:
      | Title              | first best practice            |
      | Short Description  | first short description        |
      | Content            | *italic* **bold**              |
      | Tag list           | rails, test                    |
    When I press "Share"
    Then I should see success message "Best Practice was successfully created!"
    And I should see "first best practice" page
    # TODO: The following works, but too cryptic ... ideally, feature file shouldn't
    # deal with such low level stuff. Anyway, will leave it as it is for now,
    # till we can find a better way to express it.
    And I should see "first short description" within ".description"
    And I should see "rails" within ".tags a"
    And I should see "test" within ".tags a"
    And I should see "italic" within ".wikistyle em"
    And I should see "bold" within ".wikistyle strong"

  Scenario Outline: Unsuccessful create with missing info
    Given I fill in the following:
      | Title              | <title>   |
      | Short Description  |           |
      | Content            | <content> |
      | Tag list           |           |
    When I press "Share"
    Then I should be on create post failure page
    And I should see "<field>" with error "can't be blank"

    Examples:
      | title     | content   | field   |
      |           | something | Title   |
      | something |           | Content |

  Scenario: Unsuccessful create with duplicated title
    Given a post exists with title: "first best practice"
    And I fill in the following:
      | Title              | first best practice     |
      | Short Description  | first short description |
      | Content            | *italic* **bold**       |
      | Tag list           | rails, test             |
    When I press "Share"
    Then I should be on create post failure page
    And I should see "Title" with error "has already been taken"

