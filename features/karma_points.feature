  
  Feature: Karma points
    As a student
    I want to know my karma points

  Background:
    Given the course with teacher and student enrolled

  Scenario: Initial karma points
    Given I am logged in as student
    Then I know that my karma points are "0"
  
  Scenario: Karma points after the teacher gives me one point
    Given teacher gives one karma point to student
    When I am logged in as student
    Then I know that my karma points are "1" 
  
  Scenario: Karma points after the teacher gives me two points
    Given teacher gives two karma points to student
    When I am logged in as student
    Then I know that my karma points are "2" 