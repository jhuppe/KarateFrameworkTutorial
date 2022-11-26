Feature: To test the get end point of the application
  To test different get end point with different data format supported by the application

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the date in JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response ==
      """
      [
      {
      "jobId": 1, 
      "jobTitle": "Software Engg", 
      "project": [
      {
      "technology": [
      	"Kotlin", 
      	"SQL Lite", 
      	"Gradle"
      ], 
      "projectName": "Movie App"
      }
      ], 
      "jobDescription": "To develop android application", 
      "experience": [
      	"Google", 
      	"Apple", 
      	"Mobile Iron"
      ]
      }
      ]
      """
