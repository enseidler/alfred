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
  
  Scenario: Correction without templates
    Given I am logged in as teacher
    And I go to the homepage
    And I follow "Mis correcciones"
    And I click "Corregir" on last correction
    Then public comments should be empty
    And private comments should be empty

  Scenario: Correction with templates
    Given an assignment "TP3" with public template "publico" and private template "privado" already created
    And "TP3" has link solution submitted by student
    And a teacher assigned himself as on-charge of correction for "TP3"
    When I am logged in as teacher
    And I go to the homepage
    And I follow "Mis correcciones"
    And I click "Corregir" on last correction
    Then public comments should say "publico"
    And private comments should say "privado"

  @wip
  Scenario: Save and go to the assignments page
    Given I am logged in as teacher
    And I go to the homepage
    And I follow "Mis correcciones"
    And I click "Corregir" on last correction
    And I fill in correction's information fields
    When I click "Guardar e ir a TPs"
    Then I should be on the assignments page
    And I should see "fue actualizado correctamente"
    And Correction's data successfuly updated
    And Mail has been sent to student
  