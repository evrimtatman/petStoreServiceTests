Feature: Adding a new pet

  Background:
    * url 'https://petstore.swagger.io/v2'
    * header Accept = 'application/json'
    * def result = callonce read('../users/addNewPet.feature')


  Scenario: Querying the created pet
  Given path 'pet', result.id
  When method get
  Then status 200
  And print response
  And print responseStatus
