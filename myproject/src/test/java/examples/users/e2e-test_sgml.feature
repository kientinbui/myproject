Feature: upload all documents

  Background:
    * url 'https://service-mesh-ingress-uat.fundingasiagroup.com/borrower-backend-service'


  Scenario: upload bank statement doc
    * call read('classpath/examples/users/uploadfileElevate.feature')

  Scenario: