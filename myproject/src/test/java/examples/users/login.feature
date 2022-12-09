Feature: login

  Scenario: register phone number

    Given url 'https://uat.fundingasiagroup.com'
    When path 'api/v2/users/registration/mobile'

      * def payload =
      """
      {"mobile_phone_number":"+6285156659234","country_code":"SG","client_id":"bolt_sg_borrower_webapp"}
      """

    And request payload
    And method post
    And status 201

  Scenario: validate registered phone number

    Given url 'https://service-mesh-ingress-uat.fundingasiagroup.com/borrower-backend-service'
    When path '/ext/auth/mobile'


    * def payload =
    """
    {"mobile_phone_number":"+6285156659234","country_code":"SG","otp":"162914"}
    """
    #should find how to get OTP from DB automatically
    And request payload
    And method post
    And status 200

