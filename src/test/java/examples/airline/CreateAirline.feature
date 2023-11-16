Feature: Create an airline

  Scenario: 1. Create an airline with hardcoded payload
    Given url createAirlineUrl
    And print "url is", createAirlineUrl
    And print 'someVar value', someVar
    #And print 'userType', userType
    And print 'userType direct', karate.properties['userType']
    And request {"id":4464733,"name":"Sri Lankan Airways","country":"Sri Lanka","logo":"https:\/\/upload.wikimedia.org\/wikipedia\/en\/thumb\/9\/9b\/Qatar_Airways_Logo.svg\/sri_lanka.png","slogan":"From Sri Lanka","head_quaters":"Katunayake, Sri Lanka","website":"www.srilankaairways.com","established":"1990"}
    When method post
    Then status 200

  Scenario: 2. Create an airline with multiline json payload
    Given url "https://api.instantwebtools.net/v1/airlines"
    And request
    """
    {
    "id":46364533,
    "name":"Sri Lankan Airways",
    "country":"Sri Lanka",
    "logo":"https:\/\/upload.wikimedia.org\/wikipedia\/en\/thumb\/9\/9b\/Qatar_Airways_Logo.svg\/sri_lanka.png",
    "slogan":"From Sri Lanka",
    "head_quaters":"Katunayake, Sri Lanka",
    "website":"www.srilankaairways.com",
    "established":"1990"
    }
    """
    When method post
    Then status 200

  Scenario: 3. Create an airline with created json payload
    Given url "https://api.instantwebtools.net/v1/airlines"
    * def requestPayload = {}
    * requestPayload.id = 423888
    * requestPayload.name = "Sri Lankan Airways", requestPayload.country = "Sri Lanka"
    * requestPayload.logo = "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png"
    * requestPayload.slogan = "From Sri Lanka"
    * requestPayload.head_quaters = "Katunayake, Sri Lanka"
    * requestPayload.website = "www.srilankaairways.com"
    * requestPayload.established = 1990
    * requestPayload.address = []
    * requestPayload.address[0] = {}
    * requestPayload.address[0].city = "BLR"
    * requestPayload.address[0].state = "KA"
    * requestPayload.address[1] = {}
    * requestPayload.address[1].city = "DL"
    * requestPayload.address[1].state = "DL"
    * print requestPayload
    And request requestPayload
    When method post
    Then status 200

  Scenario: 4. Create an airline with json payload from external source
    Given url "https://api.instantwebtools.net/v1/airlines"
    * def requestPayload = read('payloads/CreateAirlinePayload.json')
    * set requestPayload.id = 545452978
    * print requestPayload
    And request requestPayload
    When method post
    Then status 200
    * remove requestPayload.id
    And request requestPayload
    When method post
    Then status 200


  Scenario: 5. Create an airline with json payload from external source while adding extra fields on runtime
    Given url "https://api.instantwebtools.net/v1/airlines"
    * def requestPayload = read('payloads/CreateAirlinePayload.json')
    * set requestPayload.ceo = "Sanjiv Mathur"
    * set requestPayload.foo =
    """
    {
      "foo1" : {
        "foo2": "booboo1"
      }
    }
    """
    * set requestPayload.foo.foo1.foo2 = "foofoo"
    * set requestPayload.Skills[0] =
    """
    {
      "sub": "Java"
    }
    """
    * set requestPayload.Skills[1] =
    """
    {
      "sub": "Selenium"
    }
    """
    * print requestPayload