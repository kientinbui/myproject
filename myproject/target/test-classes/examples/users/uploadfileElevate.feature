Feature: upload documents

  Background:
    * url 'https://service-mesh-ingress-uat.fundingasiagroup.com/borrower-backend-service'
    * def username = 'salma.syahna@fundingsocieties.com'
    * def uuid = '82f43553-da13-4486-9070-10fbe87f3ae0'
    * def country = 'id'

  Scenario: upload bank statement document 1st

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = country
    Then header Content-type = 'multipart/form-data'

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'BANK_STATEMENT'

    And method post
    And status 200

  Scenario: upload bank statement document 2nd

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = country
    Then header Content-type = 'multipart/form-data'

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'BANK_STATEMENT'

    And method post
    And status 200

  Scenario: upload bank statement document 3rd

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = country
    Then header Content-type = 'multipart/form-data'

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'BANK_STATEMENT'

    And method post
    And status 200

  Scenario: upload bank statement document 4th

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = country
    Then header Content-type = 'multipart/form-data'

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'BANK_STATEMENT'

    And method post
    And status 200

  Scenario: upload bank statement document 5th

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = country
    Then header Content-type = 'multipart/form-data'

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'BANK_STATEMENT'

    And method post
    And status 200

  Scenario: upload bank statement document 6th

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = country
    Then header Content-type = 'multipart/form-data'

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'BANK_STATEMENT'

    And method post
    And status 200

  Scenario: upload KTP document

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = country
    Then header Content-type = 'multipart/form-data'

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'KTP'

    And method post
    And status 200

  Scenario: upload NPWP document

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = country
    Then header Content-type = 'multipart/form-data'

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'NPWP'

    And method post
    And status 200
