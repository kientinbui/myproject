Feature: upload documents

  Scenario: upload NIRC

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = 'sg'
    Then header Content-type = "multipart/form-data"

    #* def path = read("/Users/salma.syahna/Desktop/myproject/src/test/java/examples/users/NIRC-ex.png")

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'NRIC_FRONT'

    And method post
    And status 200

  Scenario: upload NOA

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = 'sg'
    Then header Content-type = "multipart/form-data"

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'NOA'

    And method post
    And status 200

  Scenario: upload CBS

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = 'sg'
    Then header Content-type = "multipart/form-data"

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'CBS'

    And method post
    And status 200


  Scenario: upload bank statements

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = 'sg'
    Then header Content-type = "multipart/form-data"

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'BANK_STATEMENT'

    And method post
    And status 200