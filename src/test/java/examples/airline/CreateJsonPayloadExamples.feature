Feature: Create Nested Complex Json payloads in Karate Framework using set multiple

  Scenario: Create simple JSON object
    * set jsonObjectPayload
      | path | value              |
      | id   | 12                 |
      | name | "Sanjiv's Airline" |
    * print jsonObjectPayload


  Scenario: Create nested JSON object
    * set jsonObjectPayload
      | path           | value              |
      | id             | 12                 |
      | name           | "Sanjiv's Airline" |
      | address.street | '76A'              |
      | address.city   | 'Milton City'      |
    * print jsonObjectPayload

  Scenario: Create nested JSON object and json arrays
    * set jsonObjectPayload
      | path              | value              |
      | id                | 12                 |
      | name              | "Sanjiv's Airline" |
      | address[0].street | '76A'              |
      | address[0].city   | 'Mississauga City' |
      | address[1].street | '560 Sauga Drive'  |
      | address[1].city   | 'Milton City'      |
    * print jsonObjectPayload

  Scenario: Create simple JSON object with variables
    * def idValue = 25
    * def nameValue = "San's Airline"
    * set jsonObjectPayload
      | path | value     |
      | id   | idValue   |
      | name | nameValue |
    * print jsonObjectPayload

  Scenario: Create simple Array object
    * set jsonObjectPayload
      | path | 0                  | 1                 |
      | id   | 12                 | 13                |
      | name | "Sanjiv's Airline" | "Manan's Airline" |
    * print jsonObjectPayload

  Scenario: Create simple Array object - Empty
    * set jsonObjectPayload
      | path | 0                  | 1                 |
      | id   | 12                 |                   |
      | name | "Sanjiv's Airline" | "Manan's Airline" |
    * print jsonObjectPayload

  Scenario: Create simple Array object - Null
     set jsonObjectPayload
      | pa*th | 0                  | 1                 |
      | id   | 12                 | (null)            |
      | name | "Sanjiv's Airline" | "Manan's Airline" |
    * print jsonObjectPayload

  Scenario: Manipulate existing JSON
    * def existingJsonObject = { name:  'Amod' }
    * print existingJsonObject
    * set existingJsonObject
      | path | value              |
      | id   | 12                 |
      | name | "Sanjiv's Airline" |
    * print existingJsonObject

  Scenario: Manipulate existing JSON - set with jsonpath
    * def existingJsonObject = { name:  'Amod' }
    * print existingJsonObject
    * set existingJsonObject.details
      | path | value              |
      | id   | 12                 |
      | name | "Sanjiv's Airline" |
    * print existingJsonObject

  Scenario: Manipulate existing JSON from a file - set with jsonpath
    * def existingJsonObject = read('payloads/CreateAirlinePayload.json')
    * print existingJsonObject
    * set existingJsonObject.details
      | path | value              |
      | id   | 12                 |
      | name | "Sanjiv's Airline" |
    * print existingJsonObject