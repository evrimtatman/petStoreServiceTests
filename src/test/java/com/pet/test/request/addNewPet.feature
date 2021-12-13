Feature: Adding a new pet
Background:
    * url 'https://petstore.swagger.io/v2'
    * header Accept = 'application/json'

 #add a new pet
    Scenario: create a pet and then get it by id
        * url 'https://petstore.swagger.io/v2'
        * header Accept = 'application/json'
        * def petreq = read('../data/createPetReq.json')
        * def petresp = read('../data/createPetResponse.json')

        Given path '/pet'
        And request petreq
        When method post
        Then status 200
        And match response.name != null
        And match response.name == 'Scout'
        And match response == petresp
        And match responseHeaders['Date'] == '#notnull'

        * def id = response.id
        * print 'Created id is : ' + id
        * def name = response.name
        * print 'Created pet name is :' + name