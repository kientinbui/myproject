Feature: loan creation

  Background:
    * url 'https://service-mesh-ingress-uat.fundingasiagroup.com/borrower-backend-service'
    #* call read('classpath:examples/users/login.feature')
    * def username = 'salma.syahna@fundingsocieties.com'
    * def uuid = 'c8e3372b-204d-4fcb-bc13-bd36d9136254'
    * call read('classpath:examples/users/uploadfiles.feature')
    * def doc_uuid = response.uuid
    * def id = response.dmsId
    #* call read('classpath:examples/users/loanget.feature')

  Scenario: update loan in financing requirements

    Given path '/ext/loan-draft/sg'
    Then header member-uuid = uuid
    Then header username = username
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
            "consentToBeContactedThroughWhatsapp": true
          },
          "ui": { "lastVisitedTabId": "company-details" }
        }
      """

    And request payload
    And method put
    And status 200

  Scenario: update loan in company details

    Given path '/ext/loan-draft/sg'
    Then header member-uuid = uuid
    Then header username = username
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
                  "name": "my company is mine",
                  "uen": "146758900",
                  "typeId": 10,
                  "businessIndustryId": 32,
                  "annualRevenue": 2000000
                }
              },
              "ui": { "lastVisitedTabId": "applicant-details" }
            }
          """

    And request payload
    And method put
    And status 200

  ##run this endpoint to trying change payload response
  Scenario: update loan in applicant details

    Given path '/ext/loan-draft/sg'
    Then header member-uuid = uuid
    Then header username = username
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
              "name": "my company is mine",
              "uen": "146758900",
              "typeId": 10,
              "businessIndustryId": 32,
              "annualRevenue": 2000000
            },
            "borrower": {
              "fullname": "ava testing 2nd",
              "email": "qa+test.ava@fundingsocieties.com",
              "icNumber": "S3947271F",
              "dateOfBirth": "1995-12-30",
              "isCitizen": true,
              "documents": [
                {
                  "name": "NRIC_FRONT_image (8).png",
                  "id": "2938758",
                  "uuid": "e0773abc-e25d-4577-b909-15337545d646",
                  "type": "NRIC_FRONT"
                },
                {
                  "name": "CBS_image (8).png",
                  "id": "2938760",
                  "uuid": "fa545b21-20a0-4bbf-910a-6766e8f6fd3f",
                  "type": "CBS"
                },
                {
                  "name": "NOA_image (8).png",
                  "id": "2938759",
                  "uuid": "c9b6671b-8a3a-4cbe-ad00-cfa25062c56f",
                  "type": "NOA"
                }
              ]
            }
          },
          "ui": { "lastVisitedTabId": "other-parties" }
        }
      """

    * set payload.draft[0].appliedAmount = 10000
    #* set payload.documents[0].uuid = doc_uuid
    And request payload
    And method put
    And status 200

  Scenario: update loan in other parties

    Given path '/ext/loan-draft/sg'
    Then header member-uuid = uuid
    Then header username = username
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
            "name": "my company is mine",
            "uen": "146758900",
            "typeId": 10,
            "businessIndustryId": 32,
            "annualRevenue": 2000000
          },
          "borrower": {
            "fullname": "ava testing 2nd",
            "email": "qa+test.ava@fundingsocieties.com",
            "icNumber": "S3947271F",
            "dateOfBirth": "1995-12-30",
            "isCitizen": true,
            "documents": [
              {
                "name": "NRIC_FRONT_image (8).png",
                "id": "2938758",
                "uuid": "e0773abc-e25d-4577-b909-15337545d646",
                "type": "NRIC_FRONT"
              },
              {
                "name": "CBS_image (8).png",
                "id": "2938760",
                "uuid": "fa545b21-20a0-4bbf-910a-6766e8f6fd3f",
                "type": "CBS"
              },
              {
                "name": "NOA_image (8).png",
                "id": "2938759",
                "uuid": "c9b6671b-8a3a-4cbe-ad00-cfa25062c56f",
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
    Then header member-uuid = uuid
    Then header username = username
    Then header country-id = 'sg'


    * def payload =
        """
            {
              "utm": {},
              "company": {
                "uen": "146758900",
                "name": "my company is mine",
                "typeId": 10,
                "annualRevenue": 2000000,
                "businessIndustryId": 32,
                "bank": { "name": "Bank of Singapore", "accountNumber": "12345678" },
                "documents": [
                  {
                    "name": "BANK_STATEMENT_image.png",
                    "id": "2938765",
                    "uuid": "c013ec9f-d009-43c3-8a08-ea82421daccf",
                    "type": "BANK_STATEMENT"
                  }
                ]
              },
              "borrower": {
                "email": "qa+test.ava@fundingsocieties.com",
                "fullname": "ava testing 2nd",
                "icNumber": "S3947271F",
                "documents": [
                  {
                    "id": "2938758",
                    "name": "NRIC_FRONT_image (8).png",
                    "type": "NRIC_FRONT",
                    "uuid": "e0773abc-e25d-4577-b909-15337545d646"
                  },
                  {
                    "id": "2938760",
                    "name": "CBS_image (8).png",
                    "type": "CBS",
                    "uuid": "fa545b21-20a0-4bbf-910a-6766e8f6fd3f"
                  },
                  {
                    "id": "2938759",
                    "name": "NOA_image (8).png",
                    "type": "NOA",
                    "uuid": "c9b6671b-8a3a-4cbe-ad00-cfa25062c56f"
                  }
                ],
                "isCitizen": true,
                "dateOfBirth": "1995-12-30"
              },
              "directors": [],
              "appliedTenor": 5,
              "appliedAmount": 100000,
              "financingPurpose": "business-expansion",
              "personalDataConsent": true,
              "consentToBeContactedThroughWhatsapp": true,
              "submitConsent": true
            }

        """

      * set payload.appliedTenor = 6
      * set payload.uuid = doc_uuid

    And request payload
    And method post
    And status 200

    * call read('classpath:examples/users/loanget.feature')
    * call read('classpath:examples/users/activeloan.feature')





