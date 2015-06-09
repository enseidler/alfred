Feature: Correction update
  As teacher
  I want to update the correction status

  Background:
    Given the course with teacher and student enrolled 
    And there is a bunch of assignment already created
    And there are solutions submitted by students
    And a teacher assigned himself as on-charge of correction

  Scenario: Main flow
    And   I am logged in as teacher 
    And   I go to the homepage
    And   I follow "Mis correcciones" 
    And   I click "Corregir" on last correction
    And   I fill in correction's information
    Then  I should see "fue actualizado correctamente"
    And   Correction's data successfuly updated
    And   Mail has been sent to student
  
  @wip
  Scenario: Correction without templates
    Given I am logged in as teacher
    And I go to the homepage
    And I follow "Mis correcciones"
    And I click "Corregir" on last correction
    Then public comments should be empty
    And private comments should be empty

  @wip
  Scenario: Correction with templates
    Given an assignment "TP" with public template "publico" and private template "privado" already created
    And a teacher assigned himself as on-charge of correction for "TP"
    And "TP" has solution submitted by student
    When I am logged in as teacher
    And I go to the homepage
    And I follow "Mis correcciones"
    And I click "Corregir" on last correction
    Then public comments should say "publico"
    And private comments should say "privado"