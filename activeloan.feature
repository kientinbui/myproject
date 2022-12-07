Feature: active loan creation

  Scenario: active loan

    When path '/ext/loan-draft/active'
    Then header member-uuid = '58e7f63b-3228-406f-9114-ca91172c5629'
    Then header username = 'qa+test.testing@fundingsocieties.com'
    Then header country-id = 'sg'

    When method get
    Then status 200