Feature: To test the get end point of the application
  To test different get end point with different data format supported by the application

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the date in XML format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == '1'
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    # Skip the response keyword
    And match /List/item/experience/experience[1] == 'Google'
    # Traverse the xml similar to JSON
    And match response.List.item.experience.experience[0] == 'Google'

  Scenario: To get the date in XML format and validate using fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == '#notnull'
    And match response/List/item/jobTitle == '#string'
    And match response/List/item/experience/experience[1] == '#notnull'
    And match response/List/item/project/project/projectName == '#present'
    And match response/List/item/project/project/technology/technology[2] == '#ignore'
    And match response/List/item/jobTitle == '#string? _.length == 13'
    And match response/List/item/jobTitle.id == '#notpresent'
