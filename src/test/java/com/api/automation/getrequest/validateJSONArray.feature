Feature: To test the get end point of the application
  To test different get end point with different data format supported by the application

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the date in JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'
    #validate the size of the array
    And match response.[0].experience == '#[3]'
    And match response.[0].project[0].technology == '#[3]'
    # Using wild card char
    And match response.[0].experience[*] == ['Google', 'Apple', 'Mobile Iron']
    And match response.[0].project[0].technology[*] == ['Kotlin', 'SQL Lite', 'Gradle']
    #Contains keyword
    And match response.[0].experience[*] contains ['Apple', 'Mobile Iron']
    And match response.[0].project[0].technology[*] contains ['SQL Lite']
    And match response.[*].jobId contains 1

  Scenario: To get the date in JSON format and validate using fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == '#present'
    And match response.[0].experience[1] == '#notnull'
    And match response.[0].project[0].projectName == '#ignore'
    And match response.[0].project[0].technology == '#array'
    And match response.[0].jobTitle == '#string'
    And match response.[0].jobId == '#number'
    # Complex Fuzzy matcher
    And match response.[0].jobId == '#? _ >= 1'
    And match response.[0].jobTitle == '#string? _.length >= 1'
    # To validate the array
    And match response.[0].experience == '#[]'
    And match response.[0].experience == '#[3]'
    #Make sure it is an array of strings
    And match response.[0].experience == '#[3] #string'
        And match response.[0].experience == '#[3] #string? _.length >= 2'
    
