Feature: Create
  As a blog administrator
  In order to share organize articles by category
  I want to be able to create new categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully go to new category page
    Given I am on the dashboard page
    When I follow "Categories"
    Then I should be on the admin new categories page

  Scenario: Successfully add new category
    Given I am on the admin new categories page
    When I fill in the following:
      | category_name        | Sports      |
      | category_keywords    | Tennis      |
      | category_permalink   | funsports   |
      | category_description | lets play   |
    And I press "Save"
    Then I should be on the admin new categories page
    And I should see "Sports"    
    When I follow "Sports"
    Then I should be on the admin edit categories page for "Sports"
    And the "category_name" field should contain "Sports"
    And the "category_keywords" field should contain "Tennis"
    And the "category_permalink" field should contain "funsports"
    And the "category_description" field should contain "lets play" 