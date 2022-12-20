Feature: create loan at first time

  Background:

    * url 'https://service-mesh-ingress-uat.fundingasiagroup.com/borrower-backend-service'
    * def username = 'salma.syahna@fundingsocieties.com'
    * def uuid = '5aec974b-74da-49c3-af07-4ec0776b979d'


  Scenario: borrower create loan at first time

    Given path '/ext/loan-draft/id/elevate/individual'
    Then header username = username
    Then header member-uuid = uuid
    Then header country-id = 'id'


    * def payload =
            """
            {
          "draft": {
            "financingRequirement": {
              "ownsBusiness": true,
              "businessEntityType": "INDIVIDUAL",
              "referralCode": "",
              "loanAmount": "undefined"
            },
            "personalDataConsent": true,
            "utm": {
              "utmSource": "",
              "utmMedium": "",
              "utmCampaign": "",
              "utmTerm": "",
              "utmContent": ""
            }
          },
          "delete_previous": false
        }
            """

    And request payload
    And method put
    And status 200

    And match response == {uuid:  '#uuid'}


  Scenario: get borrower at first time

    Given path '/ext/loan-draft/id/elevate/individual'
    Then header username = username
    Then header member-uuid = uuid
    Then header country-id = 'id'

    And method get
    And status 200

    And match response.ui == '##string'
    And match response.data[0].personalDataConsent == '##boolean'
    And match response.data[0].loanAmount == '##number'
    And match response.data[0].ownsBusiness == '##boolean'
    And match response.data[0].referralCode == '##string'
    And match response.data[0].businessEntityType == '##string'
    And match response.data[0].productId == '##number'
    And match response.data[0].notice == '##string'
    And match response.data[0].uuid == '##uuid'




