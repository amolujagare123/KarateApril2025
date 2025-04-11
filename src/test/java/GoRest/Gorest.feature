Feature: go rest api

  Background: setting the base url
    Given url 'https://gorest.co.in/'

  Scenario: verify create user request
    Given path '/public/v2/users'
 #   And header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'
    And header Authorization = 'Bearer' + ' ' + '8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'
    And request
    """
    {

          "name": "Asha Mishra CPA",
          "email": "asha2@gmail.com",
          "gender": "female",
          "status": "active"
        }
    """
    When method post
    Then status 201


  Scenario: verify get all user request
    Given path '/public/v2/users'
 #   And header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'
    And header Authorization = 'Bearer' + ' ' + '8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'
    When method get
    Then status 200


    @createExternalVar
  Scenario: verify create user request
    Given path '/public/v2/users'
 #   And header Authorization = 'Bearer 8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'
    And header Authorization = 'Bearer' + ' ' + '8769cc34965691163d0f8f5ad427102a5bebad9a1a7b8802777b1d41cf674efd'

    * def fileCall = call read('./support/impValues.feature')

    And request
    """
    {

          "name": "#(fileCall.name)",
          "email": "#(fileCall.email)",
          "gender": "#(fileCall.gender)",
          "status": "#(fileCall.status)"
        }
    """
    When method post
    Then status 201


