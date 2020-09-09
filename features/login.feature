# As a user
# I want to login feature
# In order to using other feature of application

Feature: Login

  Scenario: User login with existed account
    Given user in login page
    When user login with "vuphong95663" as username and "123456" as password
    And user click login button
    Then user should see welcome screen
    And you see "You are Logged In, vuphong95663"

  Scenario: User login with invalid account
    Given user in login page
    When user login with "abc" as username and '1231231' as password
    And user click login button
    Then user does not navigate to welcome sceen
    And user see "Login" title
