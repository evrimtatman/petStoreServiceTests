Feature: Query the created pet

  Background:
    * url 'https://petstore.swagger.io/v2'
    * header Accept = 'application/json'
    * def result = call read('../users/addNewPet.feature')

  Scenario: Querying the created pet
    Given path 'pet', result.id
    When method delete
    Then status 200
    And print response
    And print responseStatus
    And print 'ID---->'+result.id
    And match responseHeaders['Content-Type'] == ['application/json']
    And match response.type == "unknown"
    And match BigInt(response.message).toString() == BigInt(result.id).toString()
