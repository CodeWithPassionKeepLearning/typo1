Feature: Merge Articles Denied
  As a non blog administrator
  In order to not mess up someone else's articles
  I want to not be able to merge articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel as a non administrator
    And the following articles exist:
      | id | title        | body              |
      |  3 | Foobar       | Lorem Ipsum       |
      |  4 | Barfoo       | Lambchop Bone     |
      
  Scenario: Successfully merge articles
    Given I am on the articles page for "Foobar"
    Then I should not see merge_with