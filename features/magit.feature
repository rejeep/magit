Feature: Magit

  Background:
    Given a git project

  Scenario: Commit
    When I open magit status
    And I create file "foo.txt":
      """
      FOO
      """
    And I press "g"
    And I go to file "foo.txt"
    And I press "s"
    And I press "c"
    And I type "Adding foo."
    And I press "C-c C-c"
    Then I should see pattern "Head:.+Adding foo"
