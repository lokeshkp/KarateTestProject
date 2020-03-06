@ignore
Feature: API Authentication sample one 

	Background: 
	* url 'https://reqres.in/api/register'
	
	Scenario: Authentication Test
		Given path 'token'
		And form field grant_type = 'client_credentials'
		And form field client_id =''
		And form field client_secret =''
		When method POST
		Then status 200
		
		* def accessToken = response.access_Token
		
		Given path ''
		And header Autherization = 'Bearer'+accessToken
		When method GET
		Then status 200