Feature: Create a new User

	Background:
	* def createReqBody = read('../jsonData/createUser.json')
	* url 'https://reqres.in/api/users'
	* headers {Content-Type :'application/json', Accept: 'application/json'}
	
	Scenario: create user details
		Given url 'https://reqres.in/api/users'
		And request createReqBody
		And headers {Content-Type :'application/json', Accept: 'application/json'}
		When method POST
		Then print 'Request Body:', createReqBody
		Then status 201
	
	Scenario: create user details in with delay
		And request createReqBody
		And param delay = 3
		When method POST
		Then status 201