Feature: Query the created pet

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def result = call read('../request/addNewPet.feature')

  Scenario: Querying the created pet
    Given path 'pet', result.id
    When method delete
    Then status 200
    And print response
    And print responseStatus
    And match responseHeaders['Content-Type'] == ['application/json']
    And match response.type == "unknown"
    And match BigInt(response.message).toString() == BigInt(result.id).toString()
