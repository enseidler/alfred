Feature: Profile photo
  As a user
  I want to be able to link my Gravatar profile picture to my account

  Background:
    Given the course with teacher and student enrolled

  Scenario: User without Gravatar photo
    Given I am logged in as student
    Then I see default profile photo

  @wip
  Scenario: User with Gravatar photo
    Given a student "Ezequiel" with email "enseidler@gmail.com"
    And I log in as "Ezequiel"
    Then I see the profile photo for "enseidler@gmail.com"