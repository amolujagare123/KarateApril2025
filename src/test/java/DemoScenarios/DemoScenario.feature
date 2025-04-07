Feature: all Demo scenarios



    @DemoDataProvider
    Scenario Outline: print the data
      Given print '<name>'
      * print '<email>'
      * print '<contact>'
      * print '<city>'
      Examples:
        | name         | email                  | contact      | city         |
        | Alice Smith  | alice@example.com      | 1234567890   | New York     |
        | Bob Johnson  | bob.j@gmail.com        | 9876543210   | Los Angeles  |
        | Clara Evans  | clara.evans@mail.com   | 5556677889   | Chicago      |
        | David Brown  | david.b@domain.org     | 4441234567   | Houston      |


      @variables
      Scenario: Verify the variables
        Given def val1 = 23
        * def val2 = 45
        When print val1
        And print val2
        * def val3 = val1 + val2
        And print val3





