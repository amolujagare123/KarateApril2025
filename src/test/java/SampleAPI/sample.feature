Feature: all sample API Tests

  Background: setting the base url
    Given url 'https://reqres.in/'
    * print 'start of the test'

  @getALl
  Scenario: to verify get all users request executes successfully
  #  Given url 'https://reqres.in/'
    When path '/api/users'
    And param page = '2'
    * method get
    Then status 200
    * def user =
          """
           {
                "id": '#number',
                "email": '#string',
                "first_name": '#string',
                "last_name": '#string',
                "avatar": '#string'
              }

          """
    * def support =

          """
          {
              "url": '#string',
              "text": '#string'
            }

          """

    And match response ==
    """
    {
      "page": '#number',
      "per_page": '#number',
      "total": '#number',
      "total_pages": '#number',
      "data": '#[] #(user)',
      "support": '#(support)'
    }
    """

  @createSV @create1
  Scenario: to verify create users request executes successfully
  #  Given url 'https://reqres.in/'
    When path '/api/users'
    And request
    """
    {
        "name": "morpheus",
        "job": "leader"
     }
    """
    And method post
    Then status 201
    And match response ==
    """
    {
    "name": '#string',
    "job": '#string',
    "id": '#string',
    "createdAt": '#string'
    }
    """

  @create1
  Scenario: to verify create users request executes successfully
  #  Given url 'https://reqres.in/'
    When path '/api/users'
    And request
    """
    {
        "name": "morpheus",
        "job": "leader"
     }
    """
    And method post
    Then status 201
    And match response ==
    """
    {
    "name": "morpheus",
    "job": "leader",
    "id": "618",
    "createdAt": "2025-04-04T02:03:57.152Z"
    }
    """

    @update
  Scenario: to verify update users request executes successfully
  #  Given url 'https://reqres.in/'
    When path '/api/users/2'
    And request
    """
    {
        "name": "Venkatesh",
        "job": "Test leader"
     }
    """
    And method put
    Then status 200
    And print response.name
    And match response.name == 'Venkatesh'


  @delete
  Scenario: to verify update users request executes successfully
  #  Given url 'https://reqres.in/'
    When path '/api/users/2'
    And method delete
    Then status 204


    # -------------------------------------------------------


  @create2
  Scenario: to verify create users request executes successfully
  #  Given url 'https://reqres.in/'
    * def name = 'payal'
    * def job = 'HR'
    When path '/api/users'
    And request
    """
    {
        "name": #(name),
        "job": #(job)
     }
    """
    And method post
    Then status 201



  @createDP
  Scenario Outline: to verify create users request executes successfully
    When path '/api/users'
    And request
    """
    {
        "name": "#(name)",
        "job": "#(job)"
     }
    """
    And method post
    Then status 201
    Examples:
      | name          | job                 |
      | Alice Johnson | Software Engineer   |
      | Brian Clark   | Data Analyst        |
      | Emma Davis    | Product Manager     |
      | Daniel Moore  | UX Designer         |


  @createExternalFileVar @create1
  Scenario: to verify create users request executes successfully
  #  Given url 'https://reqres.in/'
    When path '/api/users'
    * def fileCall = call read('./support/impValues.feature')
    * def myName = fileCall.name
    * def myJob = fileCall.job
    And request
    """
    {
        "name": "#(myName)",
        "job": "#(myJob)"
     }
    """
    And method post
    Then status 201




