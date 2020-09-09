# As a user
# I want to signup feature
# In order to create account for use application

Feature: Sign up

  Scenario: User can signup account
    Given user in signup screen
    When user input "phong95663" into username field and "123456" into password field
    And user click signup button
    Then user should see welcome screen
    And you see "You are Logged In, phong95663"
