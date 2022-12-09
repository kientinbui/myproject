Feature: submit loan

  Scenario: submit micro loan

    Given url 'https://service-mesh-ingress-uat.fundingasiagroup.com/borrower-backend-service'
    When path '/ext/loan-draft/submit/sg'
    Then header member-uuid = 'bee1d466-91a0-457b-a80c-4250c915ac1b'
    Then header username = 'salma.syahna@fundingsocieties.com'
    Then header country-id = 'sg'

      * def payload =
        """
                  {
            "consentToBeContactedThroughWhatsapp": true,
            "utm": {},
            "appliedAmount": 12000,
            "appliedTenor": 8,
            "financingPurpose": "business-expansion",
            "personalDataConsent": true,
            "company": {
              "name": "circle 2n",
              "uen": "4352673",
              "typeId": 9,
              "businessIndustryId": 32,
              "annualRevenue": 100000000,
              "bank": { "name": "CIMB (Singapore)", "accountNumber": "17469007" },
              "documents": [
                {
                  "name": "BANK_STATEMENT_image (6).png",
                  "id": "2940933",
                  "uuid": "2878dc1a-8776-4737-a858-c57e74c48462",
                  "type": "BANK_STATEMENT"
                }
              ]
            },
            "borrower": {
              "fullname": "my name is u",
              "email": "qa+test.u@fundingsocieties.com",
              "icNumber": "S5209122E",
              "dateOfBirth": "1995-12-30",
              "isCitizen": true,
              "documents": [
                {
                  "name": "NRIC_FRONT_image (1).png",
                  "id": "2940931",
                  "uuid": "2878dc1a-8776-4737-a858-c57e74c48462",
                  "type": "NRIC_FRONT"
                },
                {
                  "name": "CBS_image (5).png",
                  "id": "2940933",
                  "uuid": "819ccee6-cc29-49cf-a92d-ecc5856e49a3",
                  "type": "CBS"
                },
                {
                  "name": "NOA_image (2).png",
                  "id": "2940932",
                  "uuid": "c45fd784-47c7-4892-94aa-3fd09558ae98",
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