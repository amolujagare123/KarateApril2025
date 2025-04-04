Feature: All Deck of cards Scenarios

  Background: set base url
    Given url 'https://deckofcardsapi.com/'


    Scenario: to verify the shuffle cards request
     Given path '/api/deck/new/shuffle/'
      And param deck_count = 1
      When method get
      And status 200
      And match response.remaining == 52