Feature: To validate the GET End response from file
  To validate the get endpoint response from external file

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the date in JSON format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    # Create a variable to store the data from external file
    * def actualResponse = read ("../JsonResponse.json")
    And print "File ==> ", actualResponse
    And match response == actualResponse

  Scenario: To get the date in XML format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    # Create a variable to read the data from the xml file
    * def actualResponse = read ("../XmlResponse.xml")
    And print "Xml Response ==> ", actualResponse
    And match response == actualResponse
