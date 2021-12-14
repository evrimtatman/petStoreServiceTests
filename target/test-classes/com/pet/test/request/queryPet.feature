Feature: Adding a new pet

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def result = callonce read('../request/addNewPet.feature')


  Scenario: Querying the created pet
  Given path 'pet', result.id
  When method get
  Then status 200
  And print response
  And print responseStatus
