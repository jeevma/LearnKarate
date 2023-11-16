Feature: Generate random data using Java faker library

  Scenario: Create simple JSON Object - Data Faker
    * def dataFaker = Java.type("examples.airline.utils.RandomDataGenerator")
    * def idValue = dataFaker.getRandomInteger(6)
    * def nameValue = dataFaker.getRandomFullName()
    * set jsonObjectPayload
      | path  | value    |
      | id    | idValue  |
      | name  | nameValue|
    * print jsonObjectPayload