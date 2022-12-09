Feature: loan creation

  Background:
    * url 'https://service-mesh-ingress-uat.fundingasiagroup.com/borrower-backend-service'
    * call read('classpath:examples/users/login.feature')
    * def username = response.username
    * def uuid = response.member_uuid
    #* call read('classpath:examples/users/loanget.feature')

  Scenario: update loan

    Given path '/ext/loan-draft/sg'
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = 'sg'

      * def payload =
      """
    {
      "delete_previous":false,
      "draft":{
          "appliedAmount":100000,
          "appliedTenor":6,
          "financingPurpose":"business-expansion",
          "personalDataConsent":true,
          "utm":{},
          "consentToBeContactedThroughWhatsapp":true,
          "company":{
              "name":"test",
              "uen":"13234245",
              "typeId":9,
              "businessIndustryId":29,
              "annualRevenue":100000},
          "borrower":{
              "fullname":"abcde",
              "email":"qa+test.ab@fundingsocieties.com",
              "icNumber":"S3611066F",
              "dateOfBirth":"1995-11-01",
              "isCitizen":true,
              "documents":[]
          }},
      "ui":{"lastVisitedTabId":"other-parties"}}
      """

    And request payload
    And method put
    And status 200

  Scenario: upload documents

    Given path '/ext/documents'
    Then header member-uuid = '160ac4d6-589b-4b1c-846a-2f42d9f36b2e'
    Then header username = 'qa+test.testing@fundingsocieties.com'
    Then header country-id = 'sg'
    Then header Content-type = "multipart/form-data"

    #* def path = read("/Users/salma.syahna/Desktop/myproject/src/test/java/examples/users/NIRC-ex.png")

    And multipart file file = { read: 'NIRC-ex.png' }
    And multipart field docType = 'BANK_STATEMENT'

    #* def uuid = response.uuid
    #* def dmsId = response.dmsId

    And method post
    And status 200

  Scenario: update loan-draft with doc

    Given path '/ext/loan-draft/sg'
    Then header member-uuid = 'd2de472f-cfe7-4f31-b8df-93375832b1d9'
    Then header username = 'mobile-user-d2de472f-cfe7-4f31-b8df-93375832b1d9@fundingsocieties.com'
    Then header country-id = 'sg'

    * def payload =
    """
        {
          "delete_previous": false,
          "draft": {
            "appliedAmount": 100000,
            "appliedTenor": 5,
            "financingPurpose": "business-expansion",
            "personalDataConsent": true,
            "utm": {},
            "consentToBeContactedThroughWhatsapp": true,
            "company": {
              "name": "name of company",
              "uen": "12453657",
              "typeId": 7,
              "businessIndustryId": 27,
              "annualRevenue": 1000000
            },
            "borrower": {
              "fullname": "ava tester",
              "email": "qa+test.avatest@fundingsocieties.com",
              "icNumber": "S3947271F",
              "dateOfBirth": "1995-12-30",
              "isCitizen": true,
              "documents": [
                {
                  "name": "NRIC_FRONT_image (5).png",
                  "id": "2934205",
                  "uuid": "9fd126f7-f70c-4d61-bd8b-223eb2e2f283",
                  "type": "NRIC_FRONT"
                },
                {
                  "name": "CBS_image (7).png",
                  "id": "2934207",
                  "uuid": "96d9e27f-cee4-467f-bc60-7c9ae85c780f",
                  "type": "CBS"
                },
                {
                  "name": "NOA_image (6).png",
                  "id": "2934206",
                  "uuid": "32967e59-4d5b-4bea-b198-860f2b6f34fd",
                  "type": "NOA"
                }
              ]
            },
            "directors": []
          },
          "ui": { "lastVisitedTabId": "documents" }
        }

    """

      And request payload
      And method put
      And status 200

    Scenario: submit loan draft

      Given path '/ext/loan-draft/submit/sg'
      Then header member-uuid = 'd2de472f-cfe7-4f31-b8df-93375832b1d9'
      Then header username = 'mobile-user-d2de472f-cfe7-4f31-b8df-93375832b1d9@fundingsocieties.com'
      Then header country-id = 'sg'


      * def payload =
        """
        {
            "consentToBeContactedThroughWhatsapp": true,
            "utm": {},
            "appliedAmount": 100000,
            "appliedTenor": 5,
            "financingPurpose": "business-expansion",
            "personalDataConsent": true,
            "company": {
              "name": "name of comp",
              "uen": "12453657",
              "typeId": 9,
              "businessIndustryId": 27,
              "annualRevenue": 1000000,
              "bank": {
                "name": "Bank of China (Singapore)",
                "accountNumber": "12345678"
              },
              "documents": [
                {
                  "name": "BANK_STATEMENT_NIRC-ex.png",
                  "id": "2934205",
                  "uuid": "9fd126f7-f70c-4d61-bd8b-223eb2e2f283",
                  "type": "BANK_STATEMENT"
                }
              ]
            },
            "borrower": {
              "fullname": "ava tester",
              "email": "qa+test.avatest@fundingsocieties.com",
              "icNumber": "S3947271F",
              "dateOfBirth": "1995-12-30",
              "isCitizen": true,
              "documents": [
                {
                  "name": "NRIC_FRONT_image (5).png",
                  "id": "2934205",
                  "uuid": "9fd126f7-f70c-4d61-bd8b-223eb2e2f283",
                  "type": "NRIC_FRONT"
                },
                {
                  "name": "CBS_image (7).png",
                  "id": "2934207",
                  "uuid": "96d9e27f-cee4-467f-bc60-7c9ae85c780f",
                  "type": "CBS"
                },
                {
                  "name": "NOA_image (6).png",
                  "id": "2934206",
                  "uuid": "32967e59-4d5b-4bea-b198-860f2b6f34fd",
                  "type": "NOA"
                }
              ]
            },
            "directors": [],
            "submitConsent": true
          }

        """

        And request payload
        And method post
        And status 200

      * call read('classpath:examples/users/loanget.feature')
      * call read('classpath:examples/users/activeloan.feature')





