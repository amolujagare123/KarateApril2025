Feature: all chat server API

  Background: set url
    * url 'https://demo.livehelperchat.com/site_admin'
    * def username = 'admin'
    * def password = 'demo'
 #   * def encoded = Java.type('java.util.Base64').getEncoder().encodeToString(credentials.getBytes())
 #   * print 'token =', token

  @GetAll1
  Scenario: to test the create user request
    Given path '/restapi/getusers'
    And header Authorization = 'Basic YWRtaW46ZGVtbw=='
    And header Content-Type = 'application/json'
    When method get
    Then status 200