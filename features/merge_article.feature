Feature: Merge Articles
  As a blog administrator
  In order to reduce duplicate content 
  I want to be able to merge two articles together

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
      | id | title        | body              |
      |  3 | Foobar       | Lorem Ipsum       |
      |  4 | Barfoo       | Lambchop Bone     |
    And the following comments exist:
      | id | author       | user_id | body          | article_id |
      |  1 | jimmy        | 1       | hello         | 3          |
      |  2 | julie        | 2       | world         | 4          |

  Scenario: Successfully merge articles
    Given I am on the articles page for "Foobar"
    Then I should see merge_with
    And I fill in "merge_with" with "4"  
    And I press "Merge"
    Then the article "Foobar" should have body "Lorem Ipsum Lambchop Bone"
    And the comment "world" should belong to "Foobar" 
    And I should be on the articles page for "Foobar"

  Scenario: Get error message when trying to merge with nonexistent article
    Given I am on the articles page for "Foobar"
    And I fill in "merge_with" with "5"
    And I press "Merge"
    Then the article "Foobar" should have body "Lorem Ipsum"
    And I should be on the articles page for "Foobar"
    And I should see a helpful error message

  Scenario: Get error message when trying to merge with itself
    Given I am on the articles page for "Foobar"
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then the article "Foobar" should have body "Lorem Ipsum"
    And I should be on the articles page for "Foobar"
    And I should see a helpful error message