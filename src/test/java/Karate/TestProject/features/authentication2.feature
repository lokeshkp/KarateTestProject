@ignore
Feature: API Authentication 

	Background: 
	* url 'https://reqres.in/api/register'
	
	Scenario: Authentication Test
	
		And form field email = '#(email)'
		And form field password = '#(pwd)'
		When method POST
		Then status 200
		Then print response
		
		* def accessToken = response.token
		Then print accessToken