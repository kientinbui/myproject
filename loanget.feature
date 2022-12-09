Feature: get loan creation

  Scenario: get loan

    #* def query_parameters = {uuid:  '#(uuid)', appliedAmount: '#(amount)'}

    Given path '/ext/loan-draft/sg'
    Then header member-uuid = 'd2de472f-cfe7-4f31-b8df-93375832b1d9'
    Then header username = 'mobile-user-d2de472f-cfe7-4f31-b8df-93375832b1d9@fundingsocieties.com'
    Then header country-id = 'sg'
    #And params query_parameters
    When method get
    Then status 200

    #Then match response == uuid: '#(uuid)'