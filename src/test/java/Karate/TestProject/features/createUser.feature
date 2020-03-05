Feature: Create a new User

	Background:
	* def createReqBody = read('../jsonData/createUser.json')
	
	Scenario: create user details
		Given url 'https://reqres.in/api/users'
		And request createReqBody
		When method POST
		Then print 'Request Body:', createReqBody
		Then status 201