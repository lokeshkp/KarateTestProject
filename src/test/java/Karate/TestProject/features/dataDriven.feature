Feature: Data Driven Test

  Background: 
    #* def requestPayLoad = read('../jsonData/multipleUser.json')
    * url 'http://localhost:8080/student'

  Scenario Outline: creating multiple usera
    And request {"id": <id>, "firstName": <firstName>, "lastName": <lastName>, "email": <email>, "programme": <programme>, "courses": <course>}
    #And request {"id":101,"firstName":"Lokesh","lastName":"Kondepudi","email":"kplokesh@gmail.com","programme":"Cypress","courses":["JavaScript"]}
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    * def res = response
    Then print res
    And match res contains {msg: 'Student added'}

    Examples: 
     # | id  | firstName    | lastName  | email               | programme | course            |
     # | 101 | Lokesh       | Kondepudi | kplokesh@gmail.com  | Cypress   | [JavaScript,Java] |
     # | 102 | Pavani       | Kondepudi | kppavani@gmail.com  | Java      | [TypeScript]      |
     # | 103 | dileep       | Kondepudi | kpdileep@gmail.com  | Selenium  | [GroovyScript]    |
     # | 104 | saikarthikye | Kondepudi | kpkarthik@gmail.com | AI        | [Python]          |
     
     |read('../jsonData/inputData.csv')|
