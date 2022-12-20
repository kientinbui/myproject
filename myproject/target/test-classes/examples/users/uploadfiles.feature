Feature: upload documents

  Background:
    * url 'https://service-mesh-ingress-uat.fundingasiagroup.com/borrower-backend-service'
    * def username = 'salma.syahna@fundingsocieties.com'
    * def uuid = 'c8e3372b-204d-4fcb-bc13-bd36d9136254'

  Scenario: upload NIRC

    Given path '/ext/documents'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = 'sg'
    Then header Content-type = "multipart/form-data"

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'NRIC_FRONT'

    And method post
    And status 200


    * def id = response.dmsId
    * def uuid = response.uuid

    * def payload =
        """
               {
                  "name": "NRIC_FRONT_image (8).png",
                   "id": "2938758",
                   "uuid": "e0773abc-e25d-4577-b909-15337545d646",
                   "type": "NRIC_FRONT"
               }

        """

    * set payload.name = "NIRC_FRONT_NIRC.png"
    * set payload.id = id
    * set payload.uuid = uuid

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


    * def id = response.dmsId
    * def uuid = response.uuid

    * def payload =
        """
               {
                  "name": "NRIC_FRONT_image (8).png",
                   "id": "2938758",
                   "uuid": "e0773abc-e25d-4577-b909-15337545d646",
                   "type": "NOA"
               }

        """
    * set payload.name = "NOA_NOA.png"
    * set payload.id = id
    * set payload.uuid = uuid

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

    * def id = response.dmsId
    * def uuid = response.uuid

    * def payload =
        """
               {
                  "name": "NRIC_FRONT_image (8).png",
                   "id": "2938758",
                   "uuid": "e0773abc-e25d-4577-b909-15337545d646",
                   "type": "CBS"
               }

        """

    * set payload.name = "CBS_CBS.png"
    * set payload.id = id
    * set payload.uuid = uuid


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


    * def id = response.dmsId
    * def uuid = response.uuid

    * def payload =
        """
               {
                  "name": "NRIC_FRONT_image (8).png",
                   "id": "2938758",
                   "uuid": "e0773abc-e25d-4577-b909-15337545d646",
                   "type": "BANK_STATEMENT"
               }

        """

    * set payload.name = "BANK_STATEMENT_BANK_STATEMENTC.png"
    * set payload.id = id
    * set payload.uuid = uuid

    #* def path = read("/Users/salma.syahna/Desktop/myproject/src/test/java/examples/users/NIRC-ex.png")