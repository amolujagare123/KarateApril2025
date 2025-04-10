Feature: All Deck of cards Scenarios

  Background: set base url
    Given url 'https://deckofcardsapi.com/'


    Scenario: to verify the shuffle cards request
     Given path '/api/deck/new/shuffle/'
      And param deck_count = 1
      When method get
      And status 200
      And match response.remaining == 52
      And match response ==
      """
      {
        "success": #boolean,
        "deck_id": #string,
        "remaining": #number,
        "shuffled": #boolean
      }
      """


      @drawCard
  Scenario: to verify the draw cards request
    Given path '/api/deck/new/shuffle/'
    And param deck_count = 1
    When method get
    * def deckId = response.deck_id
    * print "deck id = " , deckId
    And path '/api/deck/'+deckId+'/draw/'
    And param count = 2
    When method get
    * def image =
      """
      {
      "svg": '#string',
      "png": '#string'
      }
        """
        * def card =
      """
      {
      "code": '#string',
      "image": '#string',

      "images": '#(image)',

      "value": '#string',
      "suit": '#string'
      }

        """

        Then match response ==
        """
        {
          "success": '#boolean',
          "deck_id": '#string',
          "cards": '#[] #(card)',
          "remaining": '#number'
        }
        """