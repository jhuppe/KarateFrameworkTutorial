@Regression @Confidence
Feature: To test the Get endpoint with the query parameter
  Get /normal/webapi/find

  Background: Create and intitialize base Url
    Given url 'http://localhost:9897'

  Scenario: To get the data using query parameter
    # Create the Job Entry
    # Get the newly created Job Entry using query param
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createJobId)' }
    # Send the Get request with query param
    Given path '/normal/webapi/find'
    And params {id:'#(createJobId)', jobTitle:'Software Engg - 2'}
    And headers {Accept:'application/json'}
    When method get
    Then status 200
    And match response.jobId == createJobId

      Scenario: To get the data using query parameter with JobId not present in application
    # Create the Job Entry
    # Get the newly created Job Entry using query param
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createJobId)' }
    # Send the Get request with query param
    Given path '/normal/webapi/find'
    And params {id: 7864326, jobTitle:'Software Engg - 2'}
    And headers {Accept:'application/json'}
    When method get
    Then status 404
