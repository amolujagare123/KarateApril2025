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

  @create
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